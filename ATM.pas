program SimulasiATM;
uses crt;

var
  pin, pinInput: string;
  pilihan, i: integer;
  saldo, nominal: real;
  loginBerhasil: boolean;
  ch: char;

begin
  clrscr;
  // Inisialisasi awal
  pin := '123456';
  saldo := 1000000; // Saldo awal Rp 1.000.000
  loginBerhasil := false;
  pilihan := 0;

  writeln('=== SELAMAT DATANG DI SIMULASI ATM ===');

  // Perulangan 1: Cek PIN maks 3 kali percobaan (while-do)
  i := 1;
  while (i <= 3) and (not loginBerhasil) do
  begin
    write('Masukkan PIN Anda (Percobaan ', i, '/3): ');

    // Input PIN disamarkan dengan bintang * ok
    pinInput := '';
    repeat
      ch := readkey;
      if (ch >= '0') and (ch <= '9') then
      begin
        pinInput := pinInput + ch;
        write('*');
      end
      else if (ch = #8) and (length(pinInput) > 0) then
      begin
        delete(pinInput, length(pinInput), 1);
        write(#8' '#8);
      end;
    until ch = #13;
    writeln;

    if pinInput = pin then
    begin
      loginBerhasil := true;
      writeln('Login Berhasil!');
      delay(1000);
    end
    else
    begin
      writeln('PIN Salah!');
      i := i + 1;
    end;
  end;

  // Jika login berhasil, masuk ke menu utama
  if loginBerhasil then
  begin
    // Perulangan 2: Menu interaktif (repeat-until)
    repeat
      clrscr;
      writeln('====================================');
      writeln('             MENU ATM               ');
      writeln('====================================');
      writeln('1. Cek Saldo');
      writeln('2. Setor Tunai');
      writeln('3. Tarik Tunai');
      writeln('4. Keluar');
      writeln('====================================');
      write('Pilih menu (1-4): ');

      // Validasi input agar tidak crash jika diisi huruf
      {$I-}
      readln(pilihan);
      {$I+}
      if IOResult <> 0 then
        pilihan := 0;

      // Pengkondisian pakai case-of
      case pilihan of
        1:
          begin
            writeln;
            writeln('Saldo Anda saat ini: Rp ', saldo:0:2);
          end;
        2:
          begin
            writeln;
            write('Masukkan nominal setor: Rp ');
            {$I-}
            readln(nominal);
            {$I+}
            if IOResult <> 0 then
              nominal := 0;

            if nominal > 0 then
            begin
              saldo := saldo + nominal;
              writeln('Setor tunai berhasil! Saldo baru: Rp ', saldo:0:2);
            end
            else
              writeln('Nominal harus lebih dari 0!');
          end;
        3:
          begin
            writeln;
            write('Masukkan nominal tarik: Rp ');
            {$I-}
            readln(nominal);
            {$I+}
            if IOResult <> 0 then
              nominal := 0;

            if (nominal > 0) and (nominal <= saldo) then
            begin
              saldo := saldo - nominal;
              writeln('Penarikan berhasil! Sisa saldo: Rp ', saldo:0:2);
            end
            else if nominal > saldo then
              writeln('Penarikan gagal! Saldo tidak mencukupi.')
            else
              writeln('Nominal tidak valid!');
          end;
        4:
          begin
            writeln;
            writeln('Terima kasih telah menggunakan layanan ATM.');
          end;
      else
        writeln('Pilihan tidak valid!');
      end;

      if pilihan <> 4 then
      begin
        writeln;
        write('Tekan Enter untuk kembali ke menu...');
        readln;
      end;

    until pilihan = 4;
  end
  else
  begin
    writeln('Kartu Anda diblokir karena 3x salah PIN.');
  end;

  readln;
end.