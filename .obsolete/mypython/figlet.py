# figlet.py
import argparse
import pyfiglet

def display_figlet(message):
    ascii = pyfiglet.figlet_format(message)
    print(ascii)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--message", type=str, default="Hello", help="Cool Figlet Text message to display ")
    args = parser.parse_args()
    display_figlet(message=args.message)
