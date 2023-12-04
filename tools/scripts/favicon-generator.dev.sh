secrets_file=".env.example"
favicon_folder="./public/favicon/"
master_url="https://res.cloudinary.com/dm4owxzlp/image/upload/v1701155470/uxd65fib8amj0fffuzic.png"

if [ ! -f "$secrets_file" ]; then
    echo "Error: File '$secrets_file' not found."
    exit 1
fi

dotenv \
  -v MASTER_URL=$master_url \
  -e $secrets_file \
  -- bash -c 'cd ./deploy/tools/favicon-generator && ./script.sh'

if [ -d "$favicon_folder" ]; then
  rm -r "$favicon_folder"
fi
mkdir -p "$favicon_folder"
cp -r ./deploy/tools/favicon-generator/output/* "$favicon_folder"