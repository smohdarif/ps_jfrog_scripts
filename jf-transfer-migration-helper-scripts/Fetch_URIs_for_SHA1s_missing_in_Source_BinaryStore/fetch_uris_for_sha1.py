import argparse
import subprocess

# usage:
# python fetch_uris_for_sha1.py   <server_id> <missing_sha1s_file> <output_file>

# Function to fetch URIs for missing SHA1 checksums
def fetch_uris(server_id, missing_sha1s_file, output_file):
    with open(missing_sha1s_file, 'r') as infile, open(output_file, 'w') as outfile:
        for sha1 in infile:
            sha1 = sha1.strip()
            cmd = f'jf rt curl "/api/search/checksum?sha1={sha1}" -s --server-id={server_id} | jq -r \'.results[].uri\''
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            if result.returncode == 0 and result.stdout:
                outfile.write(result.stdout)
            print(f"Processed SHA1: {sha1}")

    print(f"Completed fetching URIs. Check {output_file} for results.")

# Main function to parse arguments and call fetch_uris
def main():
    parser = argparse.ArgumentParser(description="Fetch URIs for missing SHA1 checksums from JFrog Artifactory")
    parser.add_argument('server_id', help="JFrog CLI server ID")
    parser.add_argument('missing_sha1s_file', help="File with missing SHA1 checksums")
    parser.add_argument('output_file', help="Output file for URIs")
    args = parser.parse_args()

    fetch_uris(args.server_id, args.missing_sha1s_file, args.output_file)

if __name__ == "__main__":
    main()
