from dotenv import load_dotenv
import os

# Load the .env file. If the file is in another directory, you can specify the path
load_dotenv()

# Access environment variables
APIKEY  = os.getenv('APIKEY')



