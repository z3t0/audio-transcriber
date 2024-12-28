import os
import sys

# Need to test this script.

def srt_to_org(srt_directory, output_file):
    """
    Convert .srt files in a directory to an Emacs .org file.

    Args:
        srt_directory (str): Path to the directory containing .srt files.
        output_file (str): Path to the output .org file.
    """
    if not os.path.exists(srt_directory):
        print(f"Error: Directory {srt_directory} does not exist.")
        sys.exit(1)

    #  example file name:  241209_1514.mp3
    srt_files = [f for f in os.listdir(srt_directory) if f.endswith('.srt')]
    srt_files.sort()

    if not srt_files:
        print(f"No .srt files found in {srt_directory}.")
        return

    with open(output_file, 'w', encoding='utf-8') as org_file:
        date= os.popen('date').read()
        org_file.write("* SRT Files Capture: " + date
                       +"\n")
        org_file.write("\n")

        for srt_file in srt_files:
            file_path = os.path.join(srt_directory, srt_file)
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()

            title = os.path.splitext(srt_file)[0]
            org_file.write(f"** TODO Capture {title}\n")
            org_file.write(f":PROPERTIES:\n:FILE: {srt_file}\n:END:\n")
            org_file.write(content)

    print(f"Organized {len(srt_files)} .srt files into {output_file}.")

if __name__ == "__main__":
    # Example usage:
    # python script.py /path/to/srt/files output.org
    if len(sys.argv) != 3:
        print("Usage: python script.py <srt_directory> <output_file>")
        sys.exit(1)

    srt_directory = sys.argv[1]
    output_file = sys.argv[2]

    srt_to_org(srt_directory, output_file)
