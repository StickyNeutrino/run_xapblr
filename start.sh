[ -d data ] || mkdir data

while true; do
    read -p "Do you want to build container locally from source? [y/n]: " source_yn

    case $source_yn in
    [Yy]* )
        echo "building container..."
        if cd xapblr; then git pull; else git clone https://github.com/StickyNeutrino/xapblr repo; fi 
        docker build ./xapblr -t xapblr
        container=xapblr
        break;;
    [Nn]* )
        container=dfitchmun/xapblr
        break;;
    * )
        echo "Please answer yes or no."
        ;;
    esac
done

read -p "Enter your blog's url: " BLOG_URL

docker run \
-e BLOG_URL=$BLOG_URL \
-v ./data:/home/xapblr/.local/share/xapblr \
-v ./APIKEY.json:/home/xapblr/.config/xapblr/APIKEY \
-p 127.0.0.1:5000:5000 \
-d \
--name xapblr \
$container

