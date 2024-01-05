String baseUrl = 'http://192.168.1.5:5002';

// AUTH
 String urlRegister = '$baseUrl/user/register';
 String urlLogin = '$baseUrl/user/login';
// Crud barang
 String inputBarang = '$baseUrl/barang/create';
 String editBarang = '$baseUrl/barang/edit';
 String getAllBarang = '$baseUrl/barang/getAll';
 String hapusBarang = '$baseUrl/barang/hapus';
 String getByIdBarang = '$baseUrl/barang/getbyid';

// Transaksi
 String createTransaksi = '$baseUrl/transaksi/create';
 String getTransaksiUser = '$baseUrl/transaksi/getbyiduser';
 String getTransaksiUserLimit = '$baseUrl/transaksi/getbyiduserlimit';
 String uploadBuktiPembayaran = '$baseUrl/transaksi/upload-bukti';

