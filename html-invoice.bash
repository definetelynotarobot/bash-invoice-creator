#!/bin/bash
html=""
css=""
error=0
export_file(){
	echo "$html" > "./index.html"
	echo "$css" > "./styles.css"
}


get_alicisirket(){

alicicp=`zenity --forms --title="Alıcı firma bilgilerini giriniz" \
	--width 500\
	--height 350\
	--text="Lütfen Alıcı Firmanın Bilgilerini Giriniz." \
	--separator="," \
	--add-entry="Şirket İsmi" \
	--add-entry="Adres" \
	--add-entry="E-Posta" \
	--add-entry="Telefon" \




`

	IFS=',' read -r -a alicisirketArray <<< "$alicicp"
	acpHtml=""
	for i in "${alicisirketArray[@]}"
	do
	   :
	   acpHtml+="

	   <li class=\"list-group-item\">&#9830;  ${i}</li>

	   "





	done


}
get_ftarihi(){

fdate=`zenity --forms --title="Fatura Tarihi" \
	--width 500\
	--height 150\
	--text="Lütfen Faturanın oluşturulduğu tarihi aralarında eğik çizgi(/) olacak şekilde giriniz." \
	--separator="," \
	--add-entry="Fatura Tarihi(gg/aa/yy)"\


`

	IFS=',' read -r -a faturatarihArray <<< "$fdate"
	fDHtml=""
	for i in "${faturatarihArray[@]}"
	do
	   :
	   fDHtml+="
	   <span class=\"badge badge-primary badge-pill\"></span>\
	   <li class=\"list-group-item\">&#9830;  ${i}</li>

	   "





	done
	get_receiptno


}
get_receiptno(){

faturano=`zenity --forms --title="Fatura Numarası" \
	--width 500\
	--height 150\
	--text="Lütfen Fatura Numaranızı giriniz" \
	--separator="," \
	--add-entry="Fatura Numarası" \



`

	IFS=',' read -r -a faturanoArray <<< "$faturano"
	fnoHtml=""
	for i in "${faturanoArray[@]}"
	do
	   :
	   fnoHtml+="
	   <span class=\"badge badge-primary badge-pill\"></span>\
	   <li class=\"list-group-item\">&#9830;  ${i}</li>

	   "





	done
	get_alicisirket

}

get_theme(){
theme_color=`
	zenity --color-selection --show-palette\
		--title="Lütfen tema rengini seçiniz."
`

css="header {
  background-color: ${theme_color};
}
body {

}
.container-ct{
  margin:0;
  padding:0;
}

.invoice-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.card-header info-text{
  text-align:center;
}
.info-text{
  text-align:center;
}
.name-text {
  color: white;
}
.align-cent{
  display:flex;
  align-items:center;
  justify-content:center;
}
.row-info{
 margin:1rem 0 1rem 0;
 border-right: 1px solid lightgrey;
 border-left: 1px solid lightgrey;

}
.card-info{
  padding:0;
}
.little-about-text {
  color: white;
  font-size: medium;
}
.item-info {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333333;
}
.item-small {
  float: left;
}
"

case $? in
    0)
    	export_file;;



    1)
        echo "Fatura oluşturulamadı"
	;;
    -1)
        echo "Beklenmeyen bir sorun ile karşılaşıldı"
	;;
esac

}


get_receipt_info(){
receiptinfo=`zenity --forms --title="Şirket Bilgileri" \
	--width 700\
	--height 550\
	--text="Fatura için gerekli olan şirket bilgilerini ve ürün detaylarını giriniz." \
	--separator="," \
	--add-entry="Şirket İsmi" \
	--add-entry="Adres" \
	--add-entry="Email"\
	--add-entry="Telefon"\
	--add-entry="Ticaret Sicil Numarası"\
	--text="Lütfen Alınan Ürünün Bilgilerini Giriniz" \
	--separator="," \
	--add-entry="Ürün Adı" \
	--add-entry="Adet" \
	--add-entry="Birim Fiyat" \
	--add-entry="Ödenecek Toplam Tutar" \

`
IFS=',' read -r -a array <<< "$receiptinfo"
echo "${array[*]}"

case $? in
    0)
    	get_ftarihi





    	html="<html lang=\"tr\">
<head>
    <meta charset=\"UTF-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Document</title>
    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">
    <link rel=\"stylesheet\" href=\"./styles.css\">
    <script src=\"https://kit.fontawesome.com/2a5eeab234.js\" crossorigin="anonymous"></script>
</head>
<body>

    <div class=\"container mt-5\">
        <header>
            <div class=\"container invoice-container\" >
                <div class=\"name-container\">
                    <h1 class=\"name-text\" > Fatura </h1>
                </div>
            </div>

        </header>
        <div class=\"container container-ct\">
            <div class=\"card\">




                <div class=\"card-body row\">
                    <div class=\"col-md-6 \" >
                        <div class=\"card\">
                            <div class=\"card-header info-text\">
                              Şirket Bilgileri
                            </div>
                            <div class=\"card-body\">
			       <ul class=\"list-group\">
                              	<li class=\"list-group-item\">&#9830;  ${array[0]}</li>
                              	<li class=\"list-group-item\">&#9830;  ${array[1]}</li>
                              	<li class=\"list-group-item\">&#9830;  ${array[2]}</li>
                              	<li class=\"list-group-item\">&#9830;  ${array[3]}</li>
                              	<li class=\"list-group-item\">&#9830;  ${array[4]}</li>
                              </ul>
                            </div>
                          </div>
                    </div>
                    <div class=\"col-md-6\" >
			<div class=\"card\">
                            <div class=\"card-header info-text\">
                              Fatura Numarası
                            </div>
                            <div class=\"card-body\">
                              <div class=\"card-body\">

                              <ul class=\"list-group\">
                              	${fnoHtml}
                              </ul>
                            </div>
                            </div>
                        <div class=\"card\">
                            <div class=\"card-header info-text\">
                              Fatura Tarihi
                            </div>
                            <div class=\"card-body\">
                              <div class=\"card-body\">

                              <ul class=\"list-group\">
                              	${fDHtml}
                              </ul>
                            </div>
                            </div>
                          </div>

                </div>


                <div class=\"card-body row\">
                    <div class=\"col-md-6 align-cent\" >

                    </div>

                    </div>
                </div>

                <div class=\"card-body row\">
                    <div class=\"col-md-6 \" >

                          </div>
                    </div>
                    <div class=\"col-md-6 align-cent\" >

                    </div>
                </div>

                <div class=\"card-body row\">
                    <div class=\"col-md-6\" >
			<div class=\"card\">
                            <div class=\"card-header info-text\">
                              Alıcı Şirket Bilgileri
                            </div>
                            <div class=\"card-body\">

                              <ul class=\"list-group\">
                              	${acpHtml}
                              </ul>
                            </div>
                        </div>
                    </div>
                    <div class=\"col-md-6 \" >

                    </div>


                    <div class=\"card-body row\">
                        <div class=\"col-md-12\" >

                          <div class=\"card\">
                            <div class=\"card-header info-text\">
                              Fatura Detayı
                            </div>
                            <div class=\"card-body\">
                              <ul class=\"list-group\">
				<li class=\"list-group-item align-cent\">&#9830;  ${array[5]}</li>
				<li class=\"list-group-item align-cent\">&#9830;  ${array[6]}</li>
				<li class=\"list-group-item align-cent\">&#9830;  ${array[7]}</li>
				<li class=\"list-group-item align-cent\">&#9830;  ${array[8]}</li>
                              </ul>
                            </div>
                        </div>
                    </div>
	    </div>

    </div>



</body>
</html>"

if [[ "$error" -eq 0 ]]; then
    get_theme

else
    return
fi


        ;;
    1)
        echo "Fatura Oluşturulmadı"
	;;
    -1)
        echo "Beklenmeyen bir sorun ile karşılaşıldı"
	;;
esac

}

get_receipt_info
