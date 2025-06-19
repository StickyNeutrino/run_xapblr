[ -d data ] || mkdir data

while true; do
    read -p "Do you want to build container locally from source? [y/n]: " source_yn

    case $source_yn in
    [Yy]* )
        if [ -d "xapblr" ]; 
        then
            cd xapblr
            git pull
        else 
            git clone https://github.com/StickyNeutrino/xapblr xapblr
            cd xapblr
        fi 

        echo "building container..."

        docker build . -t xapblr || exit -1
        container=xapblr
        cd ..
        break;;
    [Nn]* )
        container=dfitchmun/xapblr
        break;;
    * )
        echo "Please answer yes or no."
        ;;
    esac
done

docker run \
-v ./blogs.txt:/home/xapblr/blogs.txt \
-v ./data:/home/xapblr/.local/share/xapblr \
-v ./APIKEY.json:/root/.config/xapblr/APIKEY \
-p 127.0.0.1:5000:5000 \
-d \
--platform linux/amd64 \
--name xapblr \
$container

