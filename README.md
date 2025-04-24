# Indexing Tumblr with Lossy Compression

[xapblr](https://github.com/skircheis/xapblr) uses a Xapian database to index tumblr. The idea is a lossy compression based backup of your own tumblr blog with a lot more compression (semantic compression?). [Tumblr](https://en.wikipedia.org/wiki/Tumblr) is a once popular social networking site that started in 2007.

A [xapian database](https://en.wikipedia.org/wiki/Xapian) probabilistically stores information. (I don't really understand this part yet.)

Will create a directory `./data` to store data between container restarts

## Question

Is the goal to index tumblr or provide users with a way to backup their data? I find the task of indexing tumblr with probabilistic compression to be far more interesting. In this case, I would also be interested in indexing sites with adult content as the academic communities and commercial LLMs stay farther away from those topics.

Is there a reason that we are using a xapian database? I'm trying to dig into the BM-25 algorithm, but I feel that an embedding model with a vector database would be a more efficient way to search text. I may be missing the larger picture here.

## Script to run xapblr locally
1) install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

2) download or clone this repo
   
3)  open `APIKEY.json` and fill in credentials. ([How to get credentials](https://github.com/skircheis/xapblr?tab=readme-ov-file#configuration-and-initialisation))

4) add blog urls to `blogs.txt`, one per line

5) make sure docker is running

6) run `start.sh`

7) follow prompts

8) open `127.0.0.1:5000` in a web browser 

