import { useEffect, useMemo, useState } from 'react';
import { Head, Link, router } from '@inertiajs/react';
import api from '../api';

// --- KOMPONEN LAYOUT (Inline) ---
// Ini menjamin tampilan dashboard tetap jalan meskipun file Layouts terpisah belum ada.
const AuthenticatedLayout = ({ user, header, children, onLogout }) => (
    <div className="min-h-screen bg-gray-100">
        <nav className="bg-white border-b border-gray-100">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between h-16">
                    <div className="flex">
                        <div className="shrink-0 flex items-center">
                            <Link href="/dashboard" className="font-bold text-xl text-indigo-600">
                                Loyalty App
                            </Link>
                        </div>
                    </div>
                    <div className="flex items-center">
                        <div className="ml-3 relative flex items-center gap-4">
                            <span className="text-sm text-gray-500">{user?.name}</span>
                            <button
                                onClick={onLogout}
                                className="text-sm text-red-600 hover:text-red-800 font-medium"
                            >
                                Log Out
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        {header && (
            <header className="bg-white shadow">
                <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    {header}
                </div>
            </header>
        )}

        <main>{children}</main>
    </div>
);

// --- KOMPONEN UTAMA DASHBOARD ---
export default function Dashboard() {
    // State untuk data
    const [balance, setBalance] = useState(0);
    const [history, setHistory] = useState([]); // Langsung array, tanpa object {data, links} karena API belum pagination

    // Ambil user dari localStorage
    const user = useMemo(() => {
        const storedUser = localStorage.getItem('user');
        return storedUser ? JSON.parse(storedUser) : null;
    }, []);

    const logout = () => {
        localStorage.removeItem('auth_token');
        localStorage.removeItem('user');
        router.visit('/');
    };

    // Redirect jika tidak ada token/user
    useEffect(() => {
        const token = localStorage.getItem('auth_token');
        if (!token || !user) {
            router.visit('/');
        }
    }, [user]);

    // Fetch data dari API Loyalty Service
    useEffect(() => {
        if (!user) return;

        async function fetchData() {
            try {
                // 1. Ambil Saldo Poin
                const pointsRes = await api.get(
                    `${import.meta.env.VITE_LOYALTY_SERVICE_URL}/api/points/user/${user.id}`
                );
                setBalance(pointsRes.data.total_points || 0);

                // 2. Ambil Riwayat
                const historyRes = await api.get(
                    `${import.meta.env.VITE_LOYALTY_SERVICE_URL}/api/history/${user.id}`
                );

                // PERBAIKAN: Hanya gunakan 'transactions' untuk menghindari duplikasi data.
                // Backend biasanya sudah mencatat 'redeem' sebagai transaksi dengan tipe debit/negatif.
                const rawTransactions = historyRes.data.transactions || [];

                const formattedData = rawTransactions.map(t => {
                    // Logika penentuan tipe transaksi
                    // Credit = Masuk (Earn) | Debit = Keluar (Redeem)
                    const isCredit = t.type === 'earn' || parseFloat(t.amount) > 0;
                    
                    return {
                        id: t.id,
                        created_at: t.created_at,
                        // Gunakan description sebagai label utama, fallback ke 'Transaksi'
                        order_id: t.description || 'Transaksi Poin', 
                        type: isCredit ? 'credit' : 'debit',
                        // Pastikan angka selalu positif untuk tampilan (simbol +/- diatur di UI)
                        points_amount: Math.abs(parseFloat(t.amount))
                    };
                });

                // Urutkan dari yang paling baru
                formattedData.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));

                setHistory(formattedData);

            } catch (error) {
                console.error('Gagal mengambil data:', error);
            }
        }

        fetchData();
    }, [user]);

    if (!user) return null;

    return (
        <AuthenticatedLayout
            user={user}
            onLogout={logout}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Riwayat Poin</h2>}
        >
            <Head title="Riwayat Poin" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">

                    {/* Kartu Saldo */}
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg mb-6">
                        <div className="p-6 text-gray-900">
                            <h3 className="text-lg font-medium">Saldo Poin Anda</h3>
                            <p className="text-4xl font-bold text-indigo-600 mt-2">{balance} Poin</p>
                        </div>
                    </div>

                    {/* Tabel Riwayat */}
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">
                            <h3 className="text-lg font-medium mb-4">Mutasi Terakhir</h3>

                            <div className="overflow-x-auto">
                                <table className="min-w-full divide-y divide-gray-200">
                                    <thead className="bg-gray-50">
                                        <tr>
                                            <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tanggal</th>
                                            <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Keterangan</th>
                                            <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tipe</th>
                                            <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jumlah</th>
                                        </tr>
                                    </thead>
                                    <tbody className="bg-white divide-y divide-gray-200">
                                        {history.length > 0 ? (
                                            history.map((item) => (
                                                <tr key={item.id}>
                                                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                        {new Date(item.created_at).toLocaleString('id-ID')}
                                                    </td>
                                                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                        {item.order_id}
                                                    </td>
                                                    <td className="px-6 py-4 whitespace-nowrap text-sm">
                                                        <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${
                                                            item.type === 'credit' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                                                        }`}>
                                                            {item.type.toUpperCase()}
                                                        </span>
                                                    </td>
                                                    <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">
                                                        {item.type === 'credit' ? '+' : '-'}{item.points_amount}
                                                    </td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="4" className="px-6 py-4 text-center text-sm text-gray-500">
                                                    Belum ada riwayat transaksi.
                                                </td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
