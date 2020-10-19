/**
    Hutschiene (Din Rail) Grundhalterung
*/

// hutklemme(5);

module hutklemme(breite){
    // Din-Rail - Hutschiene 35m
    krempe=35.1;
    krone=25;
    hoehe=7.5;
    dicke=1.1;

    // Variable
    feder_l=15;
    feder_d=2.7;
    feder_slot=0.9;
    balken=3.6;
    haken=6;
    
    
    x1=0;
    x2=x1;
    x3=feder_d+feder_slot+balken;
    x4=x3;
    x5=feder_d+krempe+balken;
    x6=x5;
    x8=x6-balken;
    x7=x8-4;
    x9=x8;
    x10=x9-krempe+feder_slot;
    x11=x10;
    x12=x11-feder_slot;
    x13=x12;
    x14=x13+3;
    x15=2;
    
    y1=-3;
    y2=feder_l+balken+haken+dicke;
    y3=y2;
    y4=balken+haken+dicke;
    y5=y4;
    y6=0;
    y7=0;
    y8=haken-dicke;
    y9=haken;
    y10=haken;
    y11=y10+feder_l;
    y12=y11;
    y13=haken-dicke;
    y14=y13;
    y15=y1;
    
    points=[
        [x1,y1],
        [x2,y2],
        [x3,y3],
        [x4,y4],
        [x5,y5],
        [x6,y6],
        [x7,y7],
        [x7,y7+1],
        [x8,y8],
        [x9,y9],
        [x10,y10],
        [x11,y11],
        [x12,y12],
        [x13,y13],
        [x14,y14],
        [x15,y15]
    
    ];

    linear_extrude(breite){
        polygon(points);
    }
    
    function rechts(mindest,rp) = ((rp+balken)>=mindest) ? rp+balken : mindest+balken;
}