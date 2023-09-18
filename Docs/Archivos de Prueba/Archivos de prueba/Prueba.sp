// Ya salio compi1 :)



void main ( ){

/*
Declaraciones de Variables con distintas expresiones
*/


    double Operacion=9+9-7.8;

    int numero1=-3;

    char letra='a';

    String frase="Compiladores 1";

    bool flag=(numero1 == Operacion ) || (true && letra != frase);

    Console.Write(frase+" si sale");

    int b=0;
    while(b < 10){
    Console.Write("Despegando "+b);
    b++;
    }

    for (int i=0; i<10; i++){
        for (int j=0; j<10; j++){
            Console.Write("el valor de la matriz es: " + i +" "+j);
        }
    }

    int r = 1;
    do {
        Console.Write("el valor de r es: " + r);
    } while(r <=5);



void DefinirGlobales(){
	string ejeY = "Notas";
	string Clase4 = "Bases 1";
	double pe1 = 2.0;
	double pe2 = 3.0;
	double pe3 = 1.0;
}



void GraficaBarras(){
      //llamada a variable desde un json
      string Titulo= ${newvalor,"Barras.json","Titulo"};
      string TituloX=${newvalor,"Barras.json","ejeX"};
      string TituloY=ejeY;
      string [] Ejex= {"Pedro","Walter","Josue","Mario"};
      double [] Valores= {${newvalor,"Barras.json","percent2"},${newvalor,"Barras.json","percent1"},100,90.8};
	
}

void GraficaPie(){
    string Titulo= ${ NewValor, "Pie.json", "Titulo"};
    string [] Ejex= {${ NewValor, "Pie.json", "Clase1"},${ NewValor, "Pie.json", "Clase2"},"Archivos","EDD",Clase4};
    double [] Valores= {pe1,${ NewValor, "Pie.json", "percent1"},pe2,${ NewValor, "Pie.json", "percent1"},pe3};
}







}





