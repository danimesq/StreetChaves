if [ ! -e StreetChaves_1.5.1A ]; then mkdir StreetChaves_1.5.1A; fi

cp -r Animacoes ./StreetChaves_1.5.1A/
cp -r Cenarios ./StreetChaves_1.5.1A/
cp -r Efeitos ./StreetChaves_1.5.1A/
cp -r Falas ./StreetChaves_1.5.1A/
cp -r Lutadores ./StreetChaves_1.5.1A/
cp -r Musicas ./StreetChaves_1.5.1A/
cp -r Rostos ./StreetChaves_1.5.1A/
cp -r Sons ./StreetChaves_1.5.1A/
cp Chaves.exe ./StreetChaves_1.5.1A/
cp 'STREET CHAVES.txt' ./StreetChaves_1.5.1A/

if ! dpkg -l | grep -q rar; then
  echo -e "
-----------------------------------------------------------------------------------------------------
Installing dependency 'rar'...
-----------------------------------------------------------------------------------------------------"
  sudo apt-get install rar
fi

rar a StreetChaves_1.5.1A.rar StreetChaves_1.5.1A
ipfs add -q --only-hash StreetChaves_1.5.1A.rar > StreetChaves_1.5.1A.rar.cid

echo "Distribution ready!"
echo "Created files:"
echo "[1/2] StreetChaves_1.5.1A.rar"
echo "[2/2] StreetChaves_1.5.1A.rar.cid"
