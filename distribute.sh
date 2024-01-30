. ./version

if [ ! -e StreetChaves_"$version" ]; then mkdir StreetChaves_"$version";exportfolderstatus="non-existing"; fi

cp -r Animacoes ./StreetChaves_"$version"/
cp -r Cenarios ./StreetChaves_"$version"/
cp -r Efeitos ./StreetChaves_"$version"/
cp -r Falas ./StreetChaves_"$version"/
cp -r Lutadores ./StreetChaves_"$version"/
cp -r Musicas ./StreetChaves_"$version"/
cp -r Rostos ./StreetChaves_"$version"/
cp -r Sons ./StreetChaves_"$version"/
cp Chaves.exe ./StreetChaves_"$version"/
cp 'STREET CHAVES.txt' ./StreetChaves_"$version"/

if ! dpkg -l | grep -q rar; then
  echo -e "
-----------------------------------------------------------------------------------------------------
Installing dependency 'rar'...
-----------------------------------------------------------------------------------------------------"
  sudo apt-get install rar
fi

rar a StreetChaves_"$version".rar StreetChaves_"$version"
ipfs add -q --only-hash StreetChaves_"$version".rar > StreetChaves_"$version".rar.cid

echo "Distribution ready!"
echo "Created files:"
echo "[1/2] StreetChaves_"$version".rar"
echo "[2/2] StreetChaves_"$version".rar.cid"

if [ "$exportfolderstatus" = "non-existing" ]; then
   rm -r StreetChaves_"$version"
fi
