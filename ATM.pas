program SimulasiATM;
uses crt;

var
    pin, pinInput: string;
    pilihan, i: integer;
    saldo, nominal: real;
    loginBerhasil: boolean;

begin
    clrscr;
    // User Credentials dan Saldo Awal
    pin := '123456';
    saldo := 1000000; // Saldo awal Rp 1.000.000
    loginBerhasil := false;
    
    // Perulangan 1: Cek PIN maks 3 kali percobaan (while-do)
    writeln('=== POWERPUFF BANK ===');
    writeln;
    i := 1;
    while (i <= 3) and (not loginBerhasil) do
    begin
        writeln('Masukkan PIN Anda');
        write('> ');
        readln(pinInput);

        if pinInput = pin then
        begin
            loginBerhasil := true;
            writeln('Login Berhasil!');
        end
        else
        begin
            writeln('PIN Salah!');
            i := i + 1;
        end;
    end;

    // Jika login berhasil, masuk ke menu utama
    // Perulangan 2: Menu interaktif (repeat-until)
    if loginBerhasil then
    begin
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
            readln(pilihan);

            // Pengkondisian menggunakan case-of untuk menangani pilihan menu
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
                    readln(nominal);
                    if nominal > 0 then
                    begin
                        saldo := saldo + nominal;
                        writeln('Setor tunai berhasil! Saldo baru: Rp ', saldo:0:2);
                    end
                    else
                    begin
                        writeln('Nominal harus lebih dari 0!');
                    end;
                end;
            3: 
                begin
                    writeln;
                    write('Masukkan nominal tarik: Rp ');
                    readln(nominal);
                    if (nominal > 0) and (nominal <= saldo) then
                    begin
                        saldo := saldo - nominal;
                        writeln('Penarikan berhasil! Sisa saldo: Rp ', saldo:0:2);
                    end
                    else if nominal > saldo then
                    begin
                        writeln('Penarikan gagal! Saldo tidak mencukupi.');
                    end
                    else
                    begin
                        writeln('Nominal tidak valid!');
                    end;
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