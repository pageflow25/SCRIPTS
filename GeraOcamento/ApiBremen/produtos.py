
import os
import sys
import argparse
import json

try:
	import requests
except Exception:
	print("Missing dependency 'requests'. Install with: pip install requests")
	raise


def main(argv=None):
	parser = argparse.ArgumentParser(description='Call GET /api/v1/listarprodutos using required fields only')
	parser.add_argument('--base-url', '-u', default=os.environ.get('BREMEN_BASE_URL', 'http://192.168.2.177:9001/'),
						help='Base URL for API (default from BREMEN_BASE_URL or http://dominio)')
	# Default token provided by the user; can still be overridden via --token or BREMEN_TOKEN
	parser.add_argument('--token', '-t', default=os.environ.get('BREMEN_TOKEN',
						'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5qRTNNVEEzTjMwLkZqTXBhbUVUcExDbEFyVmNMUG16M1Nkemk0ZVVKMjA2OW1XWF9QaHF2TzA='),
						help='API token (required). Can be set via --token or BREMEN_TOKEN env var')
	# origem is required by the API but default to 1 (Produto Acabado) so the script can be run without args
	parser.add_argument('--origem', type=int, default=2, choices=[1, 2],
						help='origem (default=1): 1=Produto Acabado, 2=Modelos de produto')
	args = parser.parse_args(argv)

	if not args.token:
		print('Error: token is required via --token or BREMEN_TOKEN environment variable')
		return 2

	url = args.base_url.rstrip('/') + '/api/v1/listarprodutos'
	# Send both header styles so the server accepts whichever it expects.
	headers = {
		'token': args.token,
		'Authorization': f'Bearer {args.token}',
		'Accept': '*/*',
	}
	params = {'origem': args.origem}

	try:
		resp = requests.get(url, headers=headers, params=params, timeout=10)
	except requests.RequestException as e:
		print(f'HTTP request failed: {e}')
		return 3

	print(f'Status: {resp.status_code}')
	try:
		print(json.dumps(resp.json(), indent=2, ensure_ascii=False))
	except ValueError:
		print(resp.text)

	return 0


if __name__ == '__main__':
	raise SystemExit(main())