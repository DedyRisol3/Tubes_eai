import { useEffect, useMemo, useState } from 'react';
import { Head, Link, router } from '@inertiajs/react';
import api from '../api';

// ---------- LAYOUT MIRIP PENJAHITKU (LIGHT THEME) ----------
const AuthenticatedLayout = ({ user, header, children, onLogout }) => (
    <div className="min-h-screen bg-gray-50 text-slate-800">
        {/* Header: putih dengan aksen teal */}
        <nav className="bg-white shadow-sm">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between items-center h-16">
                    <div className="flex items-center gap-4">
                        <Link href="/" className="text-teal-600 font-extrabold text-2xl">
                            PenjahitKu
                        </Link>
                    </div>

                    <div className="flex items-center gap-4">
                        {/* Optional: kalau ada keranjang */}
                        {/* <Link href="/keranjang" className="inline-flex items-center gap-2 border rounded-lg px-3 py-2 text-teal-600 border-teal-200 bg-white hover:shadow">
                            <i className="fas fa-shopping-cart"></i>
                            <span className="text-sm">Keranjang</span>
                        </Link> */}

                        <div className="hidden sm:flex items-center gap-3">
                            <span className="text-sm text-slate-700">Halo, <span className="font-semibold">{user?.name?.split(' ')[0]}</span>!</span>
                            <button
                                onClick={onLogout}
                                className="text-sm text-red-500 border border-red-100 bg-white px-3 py-1 rounded-lg hover:bg-red-50"
                            >
                                Logout
                            </button>
                        </div>

                        {/* Mobile fallback */}
                        <div className="sm:hidden">
                            <button onClick={onLogout} className="text-sm text-red-500">Logout</button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        {/* Optional page header area */}
        {header && (
            <header className="bg-white border-t border-b border-white/60">
                <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    {header}
                </div>
            </header>
        )}

        <main className="py-8">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                {children}
            </div>
        </main>
    </div>
);

// ---------- MODAL PULSA (LIGHT STYLE) ----------
const PulsaModal = ({ isOpen, onClose, balance, userId, onSuccess }) => {
    const [step, setStep] = useState(1);
    const [selectedPackage, setSelectedPackage] = useState(null);
    const [phoneNumber, setPhoneNumber] = useState('');
    const [provider, setProvider] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState('');
    const [successData, setSuccessData] = useState(null);

    const packages = [
        { points: 100, pulsa: 5000 },
        { points: 200, pulsa: 10000 },
        { points: 400, pulsa: 25000 },
        { points: 750, pulsa: 50000 },
        { points: 1500, pulsa: 100000 },
    ];

    const providers = [
        { id: 'telkomsel', name: 'Telkomsel' },
        { id: 'xl', name: 'XL Axiata' },
        { id: 'indosat', name: 'Indosat' },
        { id: 'tri', name: 'Tri (3)' },
        { id: 'smartfren', name: 'Smartfren' },
        { id: 'axis', name: 'Axis' },
    ];

    const formatRupiah = (num) => {
        return new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
            minimumFractionDigits: 0
        }).format(num);
    };

    const handleSubmit = async () => {
        if (!selectedPackage || !phoneNumber || !provider) {
            setError('Lengkapi semua data');
            return;
        }

        if (!/^08[0-9]{9,12}$/.test(phoneNumber)) {
            setError('Format nomor HP tidak valid (contoh: 081234567890)');
            return;
        }

        if (balance < selectedPackage.points) {
            setError('Saldo poin tidak mencukupi');
            return;
        }

        setIsLoading(true);
        setError('');

        try {
            const response = await api.post('/api/pulsa/redeem', {
                user_id: userId,
                phone_number: phoneNumber,
                provider: provider,
                points_used: selectedPackage.points
            });

            if (response.data.success) {
                setSuccessData(response.data.data);
                setStep(4);
                onSuccess();
            }
        } catch (err) {
            setError(err.response?.data?.message || 'Terjadi kesalahan');
        } finally {
            setIsLoading(false);
        }
    };

    const resetModal = () => {
        setStep(1);
        setSelectedPackage(null);
        setPhoneNumber('');
        setProvider('');
        setError('');
        setSuccessData(null);
    };

    const handleClose = () => {
        resetModal();
        onClose();
    };

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
            <div className="bg-white rounded-2xl w-full max-w-lg max-h-[90vh] overflow-y-auto shadow-lg border">
                <div className="p-6 border-b">
                    <div className="flex justify-between items-center">
                        <h2 className="text-lg font-semibold text-slate-800 flex items-center gap-3">
                            <span className="text-2xl">📱</span>
                            Tukar Poin ke Pulsa
                        </h2>
                        <button onClick={handleClose} className="text-slate-500 hover:text-slate-700 text-2xl">
                            ×
                        </button>
                    </div>
                </div>

                <div className="p-6">
                    {error && (
                        <div className="mb-4 p-3 bg-red-50 border border-red-100 rounded text-red-600 text-sm">
                            {error}
                        </div>
                    )}

                    {step === 1 && (
                        <div>
                            <p className="text-sm text-slate-600 mb-4">Pilih nominal pulsa yang ingin ditukar:</p>
                            <div className="grid grid-cols-1 gap-3">
                                {packages.map((pkg) => (
                                    <button
                                        key={pkg.points}
                                        onClick={() => {
                                            setSelectedPackage(pkg);
                                            setStep(2);
                                        }}
                                        disabled={balance < pkg.points}
                                        className={`p-4 rounded-lg border transition-all flex justify-between items-center ${
                                            balance < pkg.points
                                                ? 'bg-gray-50 border-gray-100 opacity-50 cursor-not-allowed'
                                                : 'bg-white border-gray-200 hover:shadow'
                                        }`}
                                    >
                                        <div className="text-left">
                                            <p className="text-slate-800 font-semibold">{formatRupiah(pkg.pulsa)}</p>
                                            <p className="text-slate-500 text-sm">{pkg.points} Poin</p>
                                        </div>
                                        {balance < pkg.points ? (
                                            <span className="text-xs text-red-500">Poin kurang</span>
                                        ) : (
                                            <span className="text-teal-600 text-xl">→</span>
                                        )}
                                    </button>
                                ))}
                            </div>
                            <p className="text-sm text-slate-500 mt-4 text-center">
                                Saldo Anda: <span className="text-teal-600 font-semibold">{balance} Poin</span>
                            </p>
                        </div>
                    )}

                    {step === 2 && (
                        <div>
                            <div className="mb-6 p-4 bg-teal-50 border border-teal-100 rounded-lg">
                                <p className="text-teal-700 text-sm">Paket dipilih:</p>
                                <p className="text-slate-800 font-bold text-lg">
                                    {formatRupiah(selectedPackage.pulsa)} ({selectedPackage.points} Poin)
                                </p>
                            </div>

                            <div className="mb-4">
                                <label className="block text-sm text-slate-700 mb-2">Nomor HP Tujuan</label>
                                <input
                                    type="tel"
                                    value={phoneNumber}
                                    onChange={(e) => setPhoneNumber(e.target.value.replace(/\D/g, ''))}
                                    placeholder="081234567890"
                                    className="w-full px-4 py-3 bg-white border border-gray-200 rounded-lg text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-teal-200"
                                />
                            </div>

                            <div className="mb-6">
                                <label className="block text-sm text-slate-700 mb-2">Provider</label>
                                <div className="grid grid-cols-2 gap-2">
                                    {providers.map((p) => (
                                        <button
                                            key={p.id}
                                            onClick={() => setProvider(p.id)}
                                            className={`p-3 rounded-lg border text-sm font-medium transition-all ${
                                                provider === p.id
                                                    ? `bg-teal-600 border-transparent text-white`
                                                    : 'bg-white border-gray-200 text-slate-700 hover:shadow'
                                            }`}
                                        >
                                            {p.name}
                                        </button>
                                    ))}
                                </div>
                            </div>

                            <div className="flex gap-3">
                                <button
                                    onClick={() => setStep(1)}
                                    className="flex-1 py-3 rounded-lg border border-gray-200 text-slate-700 hover:bg-gray-50"
                                >
                                    Kembali
                                </button>
                                <button
                                    onClick={() => {
                                        if (phoneNumber && provider) {
                                            setStep(3);
                                        } else {
                                            setError('Lengkapi nomor HP dan provider');
                                        }
                                    }}
                                    className="flex-1 py-3 rounded-lg bg-teal-600 text-white font-semibold hover:opacity-90"
                                >
                                    Lanjut
                                </button>
                            </div>
                        </div>
                    )}

                    {step === 3 && (
                        <div>
                            <div className="bg-white rounded-lg p-4 mb-6 border border-gray-100">
                                <div className="flex justify-between">
                                    <span className="text-sm text-slate-500">Nominal Pulsa</span>
                                    <span className="text-slate-800 font-semibold">{formatRupiah(selectedPackage.pulsa)}</span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-sm text-slate-500">Poin Digunakan</span>
                                    <span className="text-slate-800 font-semibold">{selectedPackage.points} Poin</span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-sm text-slate-500">Nomor Tujuan</span>
                                    <span className="text-slate-800 font-semibold">{phoneNumber}</span>
                                </div>
                                <div className="flex justify-between">
                                    <span className="text-sm text-slate-500">Provider</span>
                                    <span className="text-slate-800 font-semibold">
                                        {providers.find(p => p.id === provider)?.name}
                                    </span>
                                </div>
                                <hr className="my-3" />
                                <div className="flex justify-between">
                                    <span className="text-sm text-slate-500">Sisa Poin</span>
                                    <span className="text-teal-600 font-semibold">{balance - selectedPackage.points} Poin</span>
                                </div>
                            </div>

                            <div className="flex gap-3">
                                <button
                                    onClick={() => setStep(2)}
                                    disabled={isLoading}
                                    className="flex-1 py-3 rounded-lg border border-gray-200 text-slate-700 hover:bg-gray-50 disabled:opacity-50"
                                >
                                    Kembali
                                </button>
                                <button
                                    onClick={handleSubmit}
                                    disabled={isLoading}
                                    className="flex-1 py-3 rounded-lg bg-teal-600 text-white font-semibold hover:opacity-90 disabled:opacity-50 flex items-center justify-center gap-2"
                                >
                                    {isLoading ? 'Memproses...' : 'Konfirmasi Tukar'}
                                </button>
                            </div>
                        </div>
                    )}

                    {step === 4 && successData && (
                        <div className="text-center">
                            <div className="w-20 h-20 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4">
                                <span className="text-4xl text-teal-600">✓</span>
                            </div>
                            <h3 className="text-lg font-bold text-slate-800 mb-2">Berhasil!</h3>
                            <p className="text-slate-600 mb-6">
                                Permintaan penukaran pulsa Anda sedang diproses. Pulsa akan dikirim dalam 1x24 jam.
                            </p>

                            <div className="bg-white rounded-lg p-4 mb-6 text-left border border-gray-100 space-y-2">
                                <div className="flex justify-between text-sm">
                                    <span className="text-slate-500">Nomor Tujuan</span>
                                    <span className="text-slate-800">{successData.phone_number}</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-slate-500">Provider</span>
                                    <span className="text-slate-800">{successData.provider}</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-slate-500">Nominal</span>
                                    <span className="text-slate-800">{formatRupiah(successData.pulsa_amount)}</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-slate-500">Status</span>
                                    <span className="px-2 py-0.5 bg-yellow-50 text-yellow-600 rounded text-xs uppercase">
                                        {successData.status}
                                    </span>
                                </div>
                            </div>

                            <button
                                onClick={handleClose}
                                className="w-full py-3 rounded-lg bg-teal-600 text-white font-semibold hover:opacity-90"
                            >
                                Selesai
                            </button>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

// ---------- RIWAYAT PULSA (KARTU PUTIH) ----------
const PulsaHistoryCard = ({ history }) => {
    const formatRupiah = (num) => {
        return new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
            minimumFractionDigits: 0
        }).format(num);
    };

    const getStatusBadge = (status) => {
        const styles = {
            pending: 'bg-yellow-50 text-yellow-600',
            processing: 'bg-blue-50 text-blue-600',
            completed: 'bg-emerald-50 text-emerald-600',
            rejected: 'bg-red-50 text-red-600'
        };
        const labels = {
            pending: 'Menunggu',
            processing: 'Diproses',
            completed: 'Selesai',
            rejected: 'Ditolak'
        };
        return (
            <span className={`px-2 py-0.5 rounded text-xs uppercase font-medium ${styles[status] || styles.pending}`}>
                {labels[status] || status}
            </span>
        );
    };

    if (history.length === 0) {
        return (
            <div className="text-center py-8 text-slate-500">
                <span className="text-4xl block mb-2">📱</span>
                Belum ada riwayat penukaran pulsa
            </div>
        );
    }

    return (
        <div className="space-y-3">
            {history.map((item) => (
                <div key={item.id} className="bg-white rounded-lg p-4 border border-gray-100 shadow-sm">
                    <div className="flex justify-between items-start mb-2">
                        <div>
                            <p className="text-slate-800 font-semibold">{formatRupiah(item.pulsa_amount)}</p>
                            <p className="text-slate-500 text-sm">{item.phone_number} • {item.provider}</p>
                        </div>
                        {getStatusBadge(item.status)}
                    </div>
                    <div className="flex justify-between items-center text-xs text-slate-500">
                        <span>{item.points_used} Poin</span>
                        <span>{new Date(item.created_at).toLocaleString('id-ID')}</span>
                    </div>
                    {item.admin_notes && item.status === 'rejected' && (
                        <p className="mt-2 text-xs text-red-600 bg-red-50 p-2 rounded">
                            {item.admin_notes}
                        </p>
                    )}
                </div>
            ))}
        </div>
    );
};

// ---------- DASHBOARD UTAMA (SAMA LOGIKA, PENAMPILAN DIUBAH) ----------
export default function Dashboard() {
    const [balance, setBalance] = useState(0);
    const [history, setHistory] = useState([]);
    const [pulsaHistory, setPulsaHistory] = useState([]);
    const [activeTab, setActiveTab] = useState('points');
    const [isPulsaModalOpen, setIsPulsaModalOpen] = useState(false);

    const user = useMemo(() => {
        const storedUser = localStorage.getItem('user');
        return storedUser ? JSON.parse(storedUser) : null;
    }, []);

    const logout = () => {
        localStorage.removeItem('auth_token');
        localStorage.removeItem('user');
        router.visit('/');
    };

    useEffect(() => {
        const token = localStorage.getItem('auth_token');
        if (!token || !user) {
            router.visit('/');
        }
    }, [user]);

    const fetchData = async () => {
        if (!user) return;

        try {
            const pointsRes = await api.get(
                `${import.meta.env.VITE_LOYALTY_SERVICE_URL}/api/points/user/${user.id}`
            );
            setBalance(pointsRes.data.total_points || 0);

            const historyRes = await api.get(
                `${import.meta.env.VITE_LOYALTY_SERVICE_URL}/api/history/${user.id}`
            );

            const rawTransactions = historyRes.data.transactions || [];
            const formattedData = rawTransactions.map(t => {
                const isCredit = t.type === 'earn' || parseFloat(t.amount) > 0;
                return {
                    id: t.id,
                    created_at: t.created_at,
                    order_id: t.description || 'Transaksi Poin',
                    type: isCredit ? 'credit' : 'debit',
                    points_amount: Math.abs(parseFloat(t.amount))
                };
            });
            formattedData.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
            setHistory(formattedData);

            const pulsaRes = await api.get(`/api/pulsa/history/${user.id}`);
            if (pulsaRes.data.success) {
                setPulsaHistory(pulsaRes.data.data);
            }

        } catch (error) {
            console.error('Gagal mengambil data:', error);
        }
    };

    useEffect(() => {
        fetchData();
    }, [user]);

    if (!user) return null;

    return (
        <AuthenticatedLayout
            user={user}
            onLogout={logout}
            header={<h2 className="text-2xl font-semibold text-slate-800">Dashboard Loyalty</h2>}
        >
            <Head title="Dashboard Loyalty" />

            <div className="space-y-6">
                {/* Kartu Saldo & CTA Tukar Pulsa (putih, mirip PenjahitKu) */}
                <div className="grid md:grid-cols-2 gap-6">
                    <div className="bg-white rounded-2xl p-6 border border-gray-100 shadow-sm">
                        <div className="flex items-center gap-4 mb-2">
                            <div className="w-12 h-12 bg-teal-50 rounded-xl flex items-center justify-center">
                                <span className="text-2xl text-teal-600">💎</span>
                            </div>
                            <div>
                                <h3 className="text-sm text-slate-500">Saldo Poin Anda</h3>
                                <p className="text-3xl font-bold text-slate-800">{balance.toLocaleString('id-ID')}</p>
                            </div>
                        </div>
                        <p className="text-sm text-slate-500">Tukarkan poin Anda dengan berbagai hadiah menarik!</p>
                    </div>

                    <div className="bg-white rounded-2xl p-6 border border-gray-100 shadow-sm">
                        <div className="flex items-center gap-4 mb-4">
                            <div className="w-12 h-12 bg-teal-50 rounded-xl flex items-center justify-center">
                                <span className="text-2xl">📱</span>
                            </div>
                            <div>
                                <h3 className="text-slate-800 font-semibold">Tukar Poin ke Pulsa</h3>
                                <p className="text-sm text-slate-500">Mulai dari 100 poin</p>
                            </div>
                        </div>
                        <button
                            onClick={() => setIsPulsaModalOpen(true)}
                            className="w-full py-3 rounded-lg bg-teal-600 text-white font-semibold hover:opacity-90"
                        >
                            Tukar Sekarang
                        </button>
                    </div>
                </div>

                {/* Tabs & Content (putih card) */}
                <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
                    <div className="border-b">
                        <div className="flex">
                            <button
                                onClick={() => setActiveTab('points')}
                                className={`flex-1 py-4 text-center font-medium transition-colors ${activeTab === 'points' ? 'text-teal-600 border-b-2 border-teal-600' : 'text-slate-600 hover:text-slate-800'}`}
                            >
                                Riwayat Poin
                            </button>
                            <button
                                onClick={() => setActiveTab('pulsa')}
                                className={`flex-1 py-4 text-center font-medium transition-colors ${activeTab === 'pulsa' ? 'text-teal-600 border-b-2 border-teal-600' : 'text-slate-600 hover:text-slate-800'}`}
                            >
                                Riwayat Pulsa
                            </button>
                        </div>
                    </div>

                    <div className="p-6">
                        {activeTab === 'points' ? (
                            <div className="overflow-x-auto">
                                <table className="min-w-full divide-y">
                                    <thead>
                                        <tr>
                                            <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Tanggal</th>
                                            <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Keterangan</th>
                                            <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Tipe</th>
                                            <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Jumlah</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y">
                                        {history.length > 0 ? (
                                            history.map((item) => (
                                                <tr key={item.id} className="hover:bg-gray-50 transition-colors">
                                                    <td className="px-4 py-4 whitespace-nowrap text-sm text-slate-600">{new Date(item.created_at).toLocaleString('id-ID')}</td>
                                                    <td className="px-4 py-4 whitespace-nowrap text-sm text-slate-800">{item.order_id}</td>
                                                    <td className="px-4 py-4 whitespace-nowrap text-sm">
                                                        <span className={`px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${item.type === 'credit' ? 'bg-emerald-50 text-emerald-600' : 'bg-red-50 text-red-600'}`}>
                                                            {item.type === 'credit' ? 'MASUK' : 'KELUAR'}
                                                        </span>
                                                    </td>
                                                    <td className={`px-4 py-4 whitespace-nowrap text-sm font-bold ${item.type === 'credit' ? 'text-emerald-600' : 'text-red-600'}`}>
                                                        {item.type === 'credit' ? '+' : '-'}{item.points_amount}
                                                    </td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="4" className="px-4 py-8 text-center text-sm text-slate-500">Belum ada riwayat transaksi poin.</td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        ) : (
                            <PulsaHistoryCard history={pulsaHistory} />
                        )}
                    </div>
                </div>
            </div>

            <PulsaModal
                isOpen={isPulsaModalOpen}
                onClose={() => setIsPulsaModalOpen(false)}
                balance={balance}
                userId={user?.id}
                onSuccess={fetchData}
            />
        </AuthenticatedLayout>
    );
}
