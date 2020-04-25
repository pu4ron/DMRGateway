#! /bin/bash
##########################################################
#
# ****************************************************** #
#                                                        #
#                    Ronualdo - PU4RON                   #
#                                                        #
# ****************************************************** #
#
#
#
echo ""
echo ""
echo "* Iniciando, aguarde...!"
echo ""
echo ""

sleep 2

sudo mount -o remount,rw /

sudo dmrgateway.service stop



home="/home/pi-star/temp"

orig="/usr/local/bin/"

gw="/home/pi-star/DMRGateway"

dest="/usr/local/bin/DMRGateway"

font="https://github.com/g4klx/DMRGateway.git"



daystamp(){
        date +"%d.%m.%y"
}
timestamp(){
        date +"%T"
}



if [ -e "$gw" ]
then
sudo rm -R "$gw" 
fi


fi
if [ -e "$home" ]
then
sudo rm -R "$home" 
else
sudo mkdir "$home"
fi


cd "$home"

sudo cp "$dest"  "$dest"-$(daystamp)_$(timestamp)

sudo rm "$dest"  

sudo git clone "$font" 

cd DMRGateway

sudo make

sudo cp DMRGateway "$orig"

sudo rm -R "$home"

sudo rm -R "$gw"


sudo mount -o remount,ro /

sudo dmrgateway.service start

sudo mmdvmhost.service restart


echo ""
echo ""
echo "* FIM!"
echo ""
echo ""
