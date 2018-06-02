#include "header.h"

void clrscr(){
    system("cls");
};

void createPemilik(list_pemilik &lp){
    lp.first = NULL;
    lp.last = NULL;
};

void createTipe(list_jenis &lj){
    lj.first = NULL;
    lj.last = NULL;
};

adr_jenis allocate_jenis(string x){
    adr_jenis p = new elm_jenis;
    p->info.tipe = x ;
    p->info.jumlah = 0 ;
    p->next = NULL;
    p->prev = NULL;

    return p;
};

adr_pemilik allocate_pemilik(string x){
    adr_pemilik p = new elm_pemilik;
    p->info.pemilik = x;
    p->next = NULL;
    p->prev = NULL;
    p->listhub.first = NULL;
    p->listhub.last = NULL;

    return p;
};

bool cekduplikasi(list_pemilik lp,string x){
    adr_pemilik p;
    p = lp.first;
    if (lp.first==NULL){
        return true;
    }else{
        while ((p != lp.last) && (p->info.pemilik != x)){
            p= p->next;
        }
    }

    if (p->info.pemilik  == x){
        return true;
    }else{
        return false;
    }

}

void insertfirstParent(list_pemilik &lp,adr_pemilik p){
   bool cek = cekduplikasi(lp,p->info.pemilik);
   if (lp.first != NULL){
       if (cek == false){
            p->next = lp.first;
            lp.first -> prev = p;
            lp.first = p;
        }else{
       cout<<"Nama Sudah Terdaftar"<<endl;}
    }else{
        lp.first = p;
        lp.last = p;
    }

}

bool cekKendaraan(list_jenis lj,string x){
    adr_jenis p= lj.first;

    if (lj.first != NULL){
        while ((p != lj.last) && (p->info.tipe != x)){
            p= p->next;
        }
    }else{
        return true;
    }

    if (p->info.tipe == x){
        return true;
    }else{
        return false;
    }

}

void insertfirstKendaraan(list_jenis &lj,adr_jenis q){
    bool cek = cekKendaraan(lj,q->info.tipe);
    if (lj.first != NULL){
        if (cek == true){
            cout<<"Kendaraan tersebut sudah terdaftar";
        }else{
            q->next = lj.first ;
            lj.first -> prev = q;
            lj.first = q;
        }
    }else{
        lj.first = q ;
        lj.last = q ;
    }

}

adr_pemilik findPem(list_pemilik lp,string x){
    adr_pemilik p = lp.first;

    if (lp.first == NULL){
        return NULL;
    }else{
        while (p->info.pemilik != x && p!= lp.last){
            p = p->next;
        }

        if(p->info.pemilik == x){
            return p;
        }else{
            return NULL;
        }
    }
}

adr_jenis findtype(list_jenis lj,string y){
    adr_jenis p = lj.first;

    if (lj.first == NULL){
        return NULL;
    }else{
        while (p->info.tipe != y && p!= lj.last){
            p = p->next;
        }

        if(p->info.tipe== y){
            return p;
        }else{
            return NULL;
        }
    }

}

bool cekin(list_pemilik lp,adr_jenis tmp,adr_pemilik p){
     adr_jenis q = p->listhub.first;

     if (p->listhub.first != NULL){

        while(q != NULL){
            if(q->info.tipe == tmp->info.tipe){
                q = q->next;
            }else{
                return false;
            }
        }
        return true;
     }else{
      return false;
    }
}


void makeRelation(list_jenis &lj,list_pemilik &lp,string a,string b){
   bool res = false;
   adr_pemilik p =findPem(lp,a);
   adr_jenis q = findtype(lj,b);

   if (p!=NULL && q!= NULL){
    adr_jenis tmp = allocate_jenis(q->info.tipe);
    res = cekin(lp,tmp,p);
    if (res != true){
        q->info.jumlah++;
        if(p->listhub.first!=NULL){
            tmp->next = p->listhub.first ;
            p->listhub.first->prev = tmp;
            p->listhub.first = tmp;
        }else{
            p->listhub.first = tmp;
            p->listhub.last = tmp;
        }
    }else{
        cout<<"Data invalid";
    }
   }else if(p!=NULL && q==NULL){
        cout<<"Tidak Terdapat kendaraan tersebut";
    }else if(p==NULL && q!=NULL){
        cout<<"Tidak Terdapat nama tersebut";
   }else if(p==NULL && q==NULL){
        cout<<"List Kosong";
   }
}

void cetakPemilik(list_pemilik lp){
    adr_pemilik p = lp.first;
    if(lp.first != NULL){
        while(p!=NULL){
            cout<<"->"<<'.'<<p->info.pemilik<<endl;
            p = p->next;
        }
    }else{
        cout<<"List Kosong"<<endl;
    }
}

void cetakJenis(list_jenis lj){
    adr_jenis p = lj.first;
    if(lj.first != NULL){
        while(p!=NULL){
            cout<<"->"<<'.'<<p->info.tipe<<endl;
            p = p->next;
        }
    }else{
        cout<<"List Kosong"<<endl;
    }
}

void printAll(list_pemilik lp){
    adr_pemilik p = lp.first;
    if(lp.first != NULL ){
        while(p!=NULL){
            adr_jenis q = p->listhub.first;
            cout<<"List Kendaraan "<<p->info.pemilik<<endl;
            if(p->listhub.first != NULL){
               while(q != NULL){
                    cout<<"->"<<". "<<q->info.tipe<<endl;
                    q = q->next;
                }
            }
            p = p->next;
        }
    }else{
        cout<<"List Kosong";
    }
}

void PrintSebagian(list_pemilik lp,string x){
    adr_pemilik p = findPem(lp,x);

    if (p != NULL){
        adr_jenis q = p->listhub.first ;
        while(q!=NULL){
            cout<<"->"<<'.'<<q->info.tipe<<endl;
            q = q->next;
        }
    }else{
        cout<<"Data Invalid"<<endl;
    }
}

string cekmax(list_jenis lj){
    string infomax;

    if(lj.first != NULL){
        adr_jenis p = lj.first;
        int max1 = p->info.jumlah;
        while(p!=NULL){
            if( p->info.jumlah > max1){
                max1 = p->info.jumlah;
                infomax = p->info.tipe;
            }
            p = p->next;
        }
        return infomax;
    }else{
        cout<<"Kendaraan Kosong"<<endl;
    }

}

void pemilikmax(list_pemilik lp,string maxi){

    if(lp.first == NULL){
        cout<<"List Kosong";
    }else{
        adr_pemilik p = lp.first;
        while(p!=NULL){
            adr_jenis q = p->listhub.first;
            while(q != NULL){
                if (q->info.tipe == maxi){
                    cout<<"->"<<" ."<<p->info.pemilik<<endl;
                    break;
                }
                q = q->next;
            }
            p = p->next;
        }
    }
}

string cekmin(list_jenis lj){
    string infomax;

    if(lj.first != NULL){

    adr_jenis p = lj.first;
    int max1 = p->next->info.jumlah;
        while(p!=NULL){
            if( p->info.jumlah < max1){
                max1 = p->info.jumlah;
                infomax = p->info.tipe;
            }
            p = p->next;
        }
        return infomax;
    }else{
        cout<<"Kendaraan Kosong"<<endl;
    }

}

adr_jenis findisi(adr_pemilik p,string y){

    if(p->listhub.first == NULL){
        return NULL;
    }else{
        adr_jenis q = p->listhub.first;
        while (q!=NULL && q->info.tipe != y){
            q = q->next;
        }

        if(q->info.tipe == y){
            return q;
        }else{
            return NULL;
        }
    }
}

void deleter(list_pemilik lp,list_jenis lj, string x, string y){
    adr_pemilik p = findPem(lp,x);

    if(p!=NULL){
        adr_jenis q = findisi(p,y);
        if(q!=NULL){
            if (q==p->listhub.first && q==p->listhub.last){
                p->listhub.first =NULL;
                p->listhub.last = NULL;
            }
            else if(q == p->listhub.first){
                p->listhub.first=q->next;
                p->listhub.first->prev = NULL;
                q->next=NULL;
            }else if(q==p->listhub.last){
                    p->listhub.last=q->prev;
                    p->listhub.last->next = NULL;
                    q->prev=NULL;
                }else{
                    q->prev->next=q->next;
                    q->next->prev=q->prev;
                    q->next=NULL;
                    q->prev=NULL;
            }
        }else{
            cout<<"Kendaraan invalid";
        }
    }else{
        cout<<"Data Invalid";
    }
}
