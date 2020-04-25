#!/bin/sh

# ****************************************************** #
#                                                        #
#                   Ronualdo - PU4RON                    #
#                                                        #
# ****************************************************** #

echo ""
echo ""
echo "* Iniciando, aguarde...!"
echo ""
echo ""

sleep 2

home="/tmp/temp"

orig="/usr/local/bin/"

dest="/usr/local/bin/DMRGateway"

font="https://github.com/g4klx/DMRGateway.git"

sudo dmrgateway.service stop

sudo mount -o remount,rw /

daystamp(){
        date +"%d.%m.%y"
}
timestamp(){
        date +"%T"
}

sudo mkdir "$home"

cd "$home"

sudo cp "$dest"  "$dest"-$(daystamp)_$(timestamp)

sudo rm "$dest"  

sudo git clone "$font" 

cd DMRGateway

sudo make

sudo cp DMRGateway "$orig"

sudo rm -R "$home" 

sudo mount -o remount,ro /

sudo dmrgateway.service start

sudo mmdvmhost.service restart


echo ""
echo ""
echo "* FIM!"
echo ""
echo ""
