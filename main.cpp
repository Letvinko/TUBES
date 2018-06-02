#include "header.h"

int main()
{
    int i,pil;
    string kendaraan,nama,maxi,mini;
    bool cek;
    list_pemilik lp;
    list_jenis lj;
    adr_pemilik p;
    adr_jenis q;

    createPemilik(lp);
    createTipe(lj);

    while(i!=7){
        clrscr();
        cout<<"================================================================"<<endl;
        cout<<"1. Masukan Nama pemeilik kendraan "<<endl;
        cout<<"2. Masukan Data kendaraan "<<endl;
        cout<<"3. Masukan Data kepimilikan Kendaraan "<<endl;
        cout<<"4. Cetak Data pemilik beserta kendaraan " << endl;
        cout<<"5. Hapus kendaraan " << endl;
        cout<<"6. Kendaraan Yang paling banyak dan yang paling sedikit dimiliki "<< endl;
        cout<<"7. EXIT "<<endl;
        cout<<" "<<endl;
        cout<<"Masukan Pilihan anda: ";
        cin>>i;

        switch(i){
        case(1):
            clrscr();
            cout<<"Masukan Nama: ";
            cin>>nama;
            p = allocate_pemilik(nama);
            insertfirstParent(lp,p);
            break;
        case(2):
            clrscr();
            cout<<"Masukan Kendaraan: ";
            cin>>kendaraan;
            q = allocate_jenis(kendaraan);
            insertfirstKendaraan(lj,q);
            break;
        case(3):
            clrscr();
            cout<<"Nama pemilik: "<<endl;
            cin>>nama;
            cout<<"Jenis Kendaraan: "<<endl;
            cin>>kendaraan;
            makeRelation(lj,lp,nama,kendaraan);
            getch();
            break;
        case(4):
            clrscr();
            cout<<"1. Cetak Pemilik kendaraan"<<endl;
            cout<<"2. Cetak Tipe Kendaraan yang terdaftar"<<endl;
            cout<<"3. Cek Pemilik beserta kendaraan tertentu"<<endl;
            cout<<"4. Cetak Seluruh Kepimilakan kendaraan beserta pemiliknya"<<endl;
            cout<<"Pilihan No: "<<endl;
            cin>>pil;

            switch(pil){
            case(1):
                clrscr();
                cetakPemilik(lp);
                break;
            case(2):
                clrscr();
                cetakJenis(lj);
                break;
            case(3):
                clrscr();
                cout<<"Masukan nama pemilik: "<<endl;
                cin>>nama;
                cek = cekduplikasi(lp,nama);
                if(cek==true){
                    PrintSebagian(lp,nama);
                }else{
                    cout<<"Nama Tersebut Tidak terdaftar"<<endl;
                }
                break;
            case(4):
                clrscr();
                printAll(lp);
                break;
            }
            getch();
            break;
        case(5):
            clrscr();
            cout<<"Masukan nama: "<<endl;
            cin>>nama;
            cout<<"Masukan nama kendaraan: "<<endl;
            cin>>kendaraan;
            deleter(lp,lj,nama,kendaraan);
            getch();
            break;
        case(6):
            clrscr();
            cout<<"Kendaraan Yang Paling banyak di miliki"<<endl;
            maxi = cekmax(lj);
            cout<<maxi<<endl;
            cout<<"List Pemilik kendaraan terfavorit"<<endl;
            pemilikmax(lp,maxi);
            cout<<endl;
            cout<<"Kendaraan Yang Paling sedikit di miliki"<<endl;
            mini = cekmin(lj);
            cout<<mini;
            getch();
            break;
        }
    }
}
