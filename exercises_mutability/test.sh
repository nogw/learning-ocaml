echo "folder created: $1"
echo `mkdir $1`
cd $1
echo `dune init exe $1`
