program Sewa_Kamar_Rumah_Sakit;

uses crt;
{Deklarasi tipe bentukan}
{array1}
type kmr = record
  nama,nohp,jenislayanan:string;
  wktsewa,tglmsk,blnmsk,thnmsk,tglklr,blnklr,thnklr:integer;
  duit : longint;
end;

type ruangan = record
  rng : array [1..10]of kmr ;
end;

type penyewaan = record
  lantai : array [1..4]of ruangan ;
end;
{array 2}
type list = record
  duit:longint;
  kelas1,kelas2,kelas3,kelas4:longint;
end;

type laporan_tahunan = array[2017..2022,1..12,1..31]of list;
{Variabel}
var
penyewa: penyewaan ;
harga:array [0..3]of longint;
buku : laporan_tahunan;
lt1:array [0..9]of integer;
lt2:array [0..9]of integer;
lt3:array [0..9]of integer;
lt4:array [0..9]of integer;

{Function & Procedure}
function gethari(bln,thn:integer): integer;
begin
    if  (bln=2) and (thn mod 4= 0) then
    gethari:=29
  else
    gethari:=28;

    case bln of
    1: begin
        gethari:=31;
       end;
    3: begin
        gethari:=31;
       end;
    4:begin
        gethari:=30;
      end;
    5:begin
        gethari:=31;
      end;
    6:begin
        gethari:=30;
      end;
    7:begin
        gethari:=31;
      end;
    8:begin
        gethari:=31;
      end;
    9:begin
        gethari:=30;
      end;
    10:begin
        gethari:=31;
       end;
    11:begin
        gethari:=30;
       end;
    12:begin
        gethari:=31;
       end;
    end;
end;

procedure simpansort(var lt1:array of integer ;x,y,z:integer;var k:integer);
var
  i:integer;
begin
  i:=k;
  if (x = 1) then
    begin
      lt1[i] := z;
      i:=i+1;
    end;
  k:=i;
end;

procedure simpandata(var buku1:laporan_tahunan;thn,bln,tgl:integer;duit:longint;kelas:string);
begin
  if (kelas = 'vip1') or (kelas='VIP1') then
    begin
      buku1[thn,bln,tgl].kelas1:=duit;
    end
  else
    if (kelas = 'vip2') or (kelas='VIP2') then
      begin
       buku1[thn,bln,tgl].kelas2:=duit;
      end
    else
      if (kelas = 'biasa1') or (kelas='BIASA1') then
        begin
          buku1[thn,bln,tgl].kelas3:=duit;
        end
      else
        if (kelas = 'biasa2') or (kelas='BIASA2') then
          begin
              buku1[thn,bln,tgl].kelas4:=duit;
          end;
end;

procedure tampil2(buku:laporan_tahunan;thn:integer);
var
  i,j:integer;
  res,kelas1_1,kelas1_2,kelas1_3,kelas1_4:longint;
begin
  res:=0;
  kelas1_1:=0;
  kelas1_2:=0;
  kelas1_3:=0;
  kelas1_4:=0;
  for i:=1 to 12 do
    begin
      for j := 1 to gethari(i,thn) do
        begin
          kelas1_1:=kelas1_1+buku[thn,i,j].kelas1;
          kelas1_2:=kelas1_2+buku[thn,i,j].kelas2;
          kelas1_3:=kelas1_3+buku[thn,i,j].kelas3;
          kelas1_4:=kelas1_4+buku[thn,i,j].kelas4;
          res:=res+buku[thn,i,j].kelas1;
          res:=res+buku[thn,i,j].kelas2;
          res:=res+buku[thn,i,j].kelas3;
          res:=res+buku[thn,i,j].kelas4;
        end;
    end;
    writeln('Pemasukan Tahun ',thn);
    writeln('Pemasukan dari VIP1 ',kelas1_1);
    writeln('Pemasukan dari VIP1 ',kelas1_2);
    writeln('Pemasukan dari BIASA1 ',kelas1_3);
    writeln('Pemasukan dari BIASA2 ',kelas1_4);
    write('Totalnya RP.',res);

end;

function HargaKelas(x:string; harga: array of longint): longint;
var
kelas1,kelas2,kelas3,kelas4: longint;
begin
        kelas1:=harga[0];
        kelas2:=harga[1];
        kelas3:=harga[2];
        kelas4:=harga[3];
        if ( x = 'VIP1') or ( x = 'vip1') then
                HargaKelas:=kelas1
        else
                if ( x = 'VIP2') or ( x = 'vip2') then
                        HargaKelas:=kelas2
                else
                        if ( x = 'BIASA1') or ( x = 'biasa1') then
                                HargaKelas:=kelas3
                        else
                                if ( x = 'BIASA2') or ( x = 'biasa2') then
                                        Hargakelas:=kelas4;
end;

function Hargatot(x:longint; y:integer): longint;
begin
    Hargatot:= y*x;
end;

function iskabisat(x:integer):boolean;
begin
  if (x mod 4 = 0) then
    iskabisat:=true
  else
    iskabisat:=false;
end;

procedure waktukeluar(w,x,y,z:integer;var tglhasil,blnhasil,thnhasil:integer);
var
  thn,tgl,bln:integer;
begin
  bln:=x;
  thn:=y;
  tgl:=w+z;

  tglhasil:=0;
  blnhasil:=0;
  thnhasil:=0;

    if ( tgl > gethari(bln,thn) ) then
    begin
      tglhasil := (tgl - gethari(bln,thn))  ;
      blnhasil := bln + 1;
      thnhasil := thn;
    end
      else
      begin
        tglhasil:= tgl;
        blnhasil:= bln;
        thnhasil:= thn;
      end;
        if ( tgl > gethari(bln,thn) ) and (bln >= 12) then
        begin
          tglhasil := (tgl - gethari(bln,thn)) ;
          thnhasil := (1 + thn) ;
          blnhasil := (bln + 1) - 12 ;
        end;
end;

function cek_ketersediaan(penyewa : penyewaan; i, j: integer):boolean;
begin
  if (penyewa.lantai[i].rng[j].nama='') then
    cek_ketersediaan:=true
  else
    cek_ketersediaan:=false;
end;

procedure delete(var penyewa : penyewaan; i,j:integer;var triger:boolean);
begin
  penyewa.lantai[i].rng[j].nama:='';
  penyewa.lantai[i].rng[j].nohp:='';
  penyewa.lantai[i].rng[j].tglmsk:=0;
  penyewa.lantai[i].rng[j].blnmsk:=0;
  penyewa.lantai[i].rng[j].thnmsk:=0;
  penyewa.lantai[i].rng[j].wktsewa:=0;
  penyewa.lantai[i].rng[j].jenislayanan:='';
  penyewa.lantai[i].rng[j].duit:=0;
  penyewa.lantai[i].rng[j].tglklr:=0;
  penyewa.lantai[i].rng[j].blnklr:=0;
  penyewa.lantai[i].rng[j].thnklr:=0;
  triger := true;
end;

procedure Cek_keluar(var x,y,z:integer;var p,q:integer);
var
i,j:integer;
begin
  i:=1;
  j:=1;
  while (x <> penyewa.lantai[i].rng[j].tglklr) and (y <> penyewa.lantai[i].rng[j].blnklr) and (z <> penyewa.lantai[i].rng[j].thnklr) do
  begin
    if (x = penyewa.lantai[i].rng[j].tglklr) and (y = penyewa.lantai[i].rng[j].blnklr) and (z = penyewa.lantai[i].rng[j].thnklr) then
    i:=i+1;
    j:=j+1;
  end;
  p:=i;
  q:=j;
  readln;
end;

Procedure inputan (var penyewa : penyewaan;var triger:boolean;var w:integer);
var
  H: longint;
  jwb : char;
  l,r,k : integer;
  ketersediaan : boolean;
begin
  k:=w;
  repeat
    clrscr;
      writeln('Cek ketersediaan');
      write('Lantai : ');
      readln(l);
      write('Ruang : ');
      readln(r);
      writeln;
      ketersediaan:=cek_ketersediaan(penyewa,l,r);
      if (triger=true) then
        ketersediaan :=true;
      if (ketersediaan=true) then
      begin
        writeln('Kamar Siap Huni, Masukkan Data');
        writeln;
        write('Masukan Nama: ');
        readln(penyewa.lantai[l].rng[r].nama);
        write('Masukan Nomor HP: ');
        readln(penyewa.lantai[l].rng[r].nohp);
        write('Masukan Waktu Masuk DD/MM/YYYY: ');
        read(penyewa.lantai[l].rng[r].tglmsk,penyewa.lantai[l].rng[r].blnmsk,penyewa.lantai[l].rng[r].thnmsk);
        write('Lama penyewaan: ');
        readln(penyewa.lantai[l].rng[r].wktsewa);
        write('Jenis Layanan [VIP1]/[VIP2]/[BIASA1]/[BIASA2]: ');
        readln(penyewa.lantai[l].rng[r].jenislayanan);

        H := HargaKelas(penyewa.lantai[l].rng[r].jenislayanan,harga);
        penyewa.lantai[l].rng[r].duit:= Hargatot(H,penyewa.lantai[l].rng[r].wktsewa);
        waktukeluar(penyewa.lantai[l].rng[r].tglmsk,penyewa.lantai[l].rng[r].blnmsk,penyewa.lantai[l].rng[r].thnmsk,penyewa.lantai[l].rng[r].wktsewa,penyewa.lantai[l].rng[r].tglklr,penyewa.lantai[l].rng[r].blnklr,penyewa.lantai[l].rng[r].thnklr);

        clrscr;
        writeln('Terpesan Atas nama ', penyewa.lantai[l].rng[r].nama ,' Waktu Registrasi ',penyewa.lantai[l].rng[r].tglmsk,' ',penyewa.lantai[l].rng[r].blnmsk,' ',penyewa.lantai[l].rng[r].thnmsk);
        writeln('Lama Hari penyewaan ',penyewa.lantai[l].rng[r].wktsewa,' waktu keluar ',penyewa.lantai[l].rng[r].tglklr,' ',penyewa.lantai[l].rng[r].blnklr,' ',penyewa.lantai[l].rng[r].thnklr);
        writeln('Harga Yang harus di bayar adalah RP.',penyewa.lantai[l].rng[r].duit);
        simpandata(buku,penyewa.lantai[l].rng[r].thnmsk,penyewa.lantai[l].rng[r].blnmsk,penyewa.lantai[l].rng[r].tglmsk,penyewa.lantai[l].rng[r].duit,penyewa.lantai[l].rng[r].jenislayanan);
        simpansort(lt1,l,r,penyewa.lantai[l].rng[r].wktsewa,k);
        writeln;
      end
      else
        writeln('Maaf kamar tersebut sudah dihuni');
      write('Masih ingin sewa lagi? [Y]/[T]: ');
      readln(jwb);
    until ((jwb = 'T') or (jwb = 't')) or ((l = 4) and (r = 10));
end;

procedure search_penghuni(var x : string;var penyewa : penyewaan; var i,j : integer; var found : boolean);
var
  cek : boolean;
begin
  i:=0;
  cek:=False;
  while (i<4)  and (cek=False) do
  begin
    i:=i+1;
    j:=0;
    while (penyewa.lantai[i].rng[j].nama <> x) and (j<10) and (cek=False) do
    begin
      j:=j+1;
      if (penyewa.lantai[i].rng[j].nama = x) then
      begin
        cek:=true;
      end;
    end;
  end;
 found:=cek;
end;

procedure editan();
var
  a,b:integer;
  jwb:string;
begin
  write('Lantai: ');
  readln(a);
  write('ruangan: ');
  readln(b);

    if (penyewa.lantai[a].rng[b].nama <> '') and (penyewa.lantai[a].rng[b].nohp <> '') then
    begin
      write(penyewa.lantai[a].rng[b].nama,' ',penyewa.lantai[a].rng[b].nohp);
      write('Apakah Data tersebut yang akan di edit?[Y]/[T]: ');
      readln(jwb);
      if (jwb = 'Y') or (jwb='y') then
      begin
        write('Edit [Nama]/[Nomor Handphone]?: ');
        readln(jwb);
        if jwb = 'Nama' then
          begin
              write('Nama: ');
              readln(penyewa.lantai[a].rng[b].nama);
          end
        else
        begin
          if jwb = 'Nomor Handphone' then
            begin
              write('Masukan Nomor Handphone: ');
              readln(penyewa.lantai[a].rng[b].nohp);
            end;
        end;
      end;
    end
    else
      write('DATA NOT FOUND');
readln;
end;

procedure sortingan1(var lt1:array of integer);
var
  tmp,i,j,max:integer;
begin
  for i:=0 to 9 do
     begin
       max:=i;
       for j := 0 to 9 do
       begin
         if (lt1[j] > lt1[max]) then
           max:=j;
       tmp := lt1[max];
       lt1[max] := lt1[i];
       lt1[i]:=tmp;
       end;
     end;
end;

Procedure Menu();
var
  i,j,pil,tglklr,blnklr,thnklr,tahun,n,f,k : integer;
  nama : string;
  found,triger: boolean;
  jwb:char;
begin
  i:=0;
  j:=0;
  f:=0;
  k:=0;
  repeat
    clrscr;
    writeln('PILIH MENU DIBAWAH');
    writeln;
    writeln('1. Input Data');
    writeln('2. Cek Penghuni Kamar');
    writeln('3. Delete Data');
    writeln('4. Cek Pemasukan');
    writeln('5. setingan data');
    writeln('6. Edit');
    writeln('7. Cek Rekor menginap');
    writeln('8. Exit');
    writeln;
    write('Pilih: ');
    readln(pil);
    case pil of
    1 : begin
          inputan(penyewa,triger,k);
          if (i=4) and (j=10) then
            writeln('PENUH');
        end;
    2 : begin
          clrscr;
          repeat
              write('Masukkan nama penghuni :');
              readln(nama);
              search_penghuni(nama,penyewa,i,j,found);
              if (found) then
                begin
                  writeln(nama,' berada di kamar ',j,' lantai ',i);
                  writeln('Nomor Handphone ',penyewa.lantai[i].rng[j].nohp);
                  writeln('Waktu masuk ',penyewa.lantai[i].rng[j].tglmsk,'/',penyewa.lantai[i].rng[j].blnmsk,'/',penyewa.lantai[i].rng[j].thnmsk);
                  writeln('Waktu keluar ',penyewa.lantai[i].rng[j].tglklr,'/',penyewa.lantai[i].rng[j].blnklr,'/',penyewa.lantai[i].rng[j].thnklr);
                end
              else
                writeln('Nama ',nama,' tidak ditemukan');
              readln;
            write('Cek Lagi?[Y]/[T]: ');
            readln(jwb);
            clrscr;
            until(jwb='T');
        end;
    3:begin
       triger:=false;
       clrscr;
        write('Masukan waktu keluar: ');
        read(tglklr,blnklr,thnklr);
        Cek_keluar(tglklr,blnklr,thnklr,i,j);
        write(penyewa.lantai[i].rng[j].nama);
        writeln;
        write('Hapus data?[Y]/[T]: ');
        readln(jwb);
        if jwb = 'Y' then
        begin
          delete(penyewa,i,j,triger);
          write('Data Telah di hapus');
        end;
        readln;
      end;

    4:begin
      clrscr;
      writeln('Masukan Tahun: ');
      readln(tahun);
      tampil2(buku,tahun);
      readln;
      end;
    5:begin
      clrscr;
        write('Masukan Harga kelas 1: ');
        readln(harga[0]);
        write('Masukan Harga kelas 2: ');
        readln(harga[1]);
        write('Masukan Harga kelas 3: ');
        readln(harga[2]);
        write('Masukan Harga kelas 4: ');
        readln(harga[3]);
      end;
    6:begin
      clrscr;
      editan();
      end;
    7:begin
      clrscr;
        write('Masukan Lantai: ');
        readln(n);
        if (n = 1) then
          sortingan1(lt1);
          for f:=0 to 9 do
            writeln(lt1[f] ,' Hari');
      readln;
      end;
    end;
  until (pil=8);
end;
{Program Utama}
BEGIN
  clrscr;
  menu();
  readln;
END.
