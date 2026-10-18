program SimulasiATM;
uses crt;

var
    pin, pinInput: string;
    pilihan, i: integer;
    saldo, nominal: real;
    loginBerhasil: boolean;

begin
    clrscr;
    // Inisialisasi awal
    pin := '123456';
    saldo := 1000000; // Saldo awal Rp 1.000.000
    loginBerhasil := false;

    writeln('=== SELAMAT DATANG DI SIMULASI ATM ===');
    
    // Perulangan 1: Cek PIN maks 3 kali percobaan (while-do)[span_9](start_span)[span_9](end_span)
    i := 1;
    while (i <= 3) and (not loginBerhasil) do
    begin
    write('Masukkan PIN Anda (Percobaan ', i, '/3): ');
    readln(pinInput);

    if pinInput = pin then[span_10](start_span)[span_10](end_span)
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
    if loginBerhasil then[span_11](start_span)[span_11](end_span)
    begin
    // Perulangan 2: Menu interaktif (repeat-until)[span_12](start_span)[span_12](end_span)
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

        // Pengkondisian pake case-of[span_13](start_span)[span_13](end_span)
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
            if nominal > 0 then[span_14](start_span)[span_14](end_span)
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
            if (nominal > 0) and (nominal <= saldo) then[span_15](start_span)[span_15](end_span)
            begin
                saldo := saldo - nominal;
                writeln('Penarikan berhasil! Sisa saldo: Rp ', saldo:0:2);
            end
            else if nominal > saldo then[span_16](start_span)[span_16](end_span)
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
            break; // Kontrol peloncatan/keluar loop[span_17](start_span)[span_17](end_span)
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

    until pilihan = 4;[span_18](start_span)[span_18](end_span)
    end
    else
    begin
    writeln('Kartu Anda diblokir karena 3x salah PIN.');
    end;

    readln;
end.