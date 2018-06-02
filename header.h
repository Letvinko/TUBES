#ifndef HEADER_H_INCLUDED
#define HEADER_H_INCLUDED

#include <iostream>
#include <stdlib.h>
#include <conio.h>
#include <string>

using namespace std;


struct info_jenis{
    string tipe;
    int jumlah = 0;
};

typedef struct elm_jenis *adr_jenis;

struct elm_jenis{
    info_jenis info;
    adr_jenis next;
    adr_jenis prev;
};

struct list_jenis{
    adr_jenis first;
    adr_jenis last;
};

struct info_pemilik{
    string pemilik;
};

typedef struct elm_pemilik *adr_pemilik;

struct elm_pemilik{
    info_pemilik info;
    adr_pemilik next;
    adr_pemilik prev;
    list_jenis listhub;
};

struct list_pemilik{
    adr_pemilik first;
    adr_pemilik last;
};

void clrscr();
void createPemilik(list_pemilik &lp);
void createTipe(list_jenis &lj);
adr_pemilik allocate_pemilik(string x);
adr_jenis allocate_jenis(string x);
void insertfirstParent(list_pemilik &lp,adr_pemilik p);
bool cekduplikasi(list_pemilik lm,string x);
void insertfirstKendaraan(list_jenis &lj,adr_jenis q);
bool cekKendaraan(list_jenis lj,string x);
adr_jenis findtype(list_jenis lj,string y);
adr_pemilik findPem(list_pemilik lp,string x);
void makeRelation(list_jenis &lj,list_pemilik &lp,string a,string b);
adr_jenis findtype(list_jenis lj,string y);
adr_pemilik findPem(list_pemilik lp,string x);
void cetakPemilik(list_pemilik lp);
void cetakJenis(list_jenis lj);
void printAll(list_pemilik lp);
void PrintSebagian(list_pemilik lp,string x);
string cekmax(list_jenis lj);
string cekmin(list_jenis lj);
void tambahtipe(list_jenis &lj,list_pemilik &lp);
void deleter(list_pemilik lp,list_jenis lj,string x, string y);
adr_jenis findisi(adr_pemilik p,string y);
void pemilikmax(list_pemilik lp,string maxi);


#endif // HEADER_H_INCLUDED
