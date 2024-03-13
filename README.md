xss.sh is the automation of the following work

1. subfinder -d indeed.com -o indeed.txt                                //Find Subdomains
2. httpx -l subdomains.txt -o httpx.txt                                 // Live Subdomains
3. echo "indeed.com" | gau --threads 5 >> Enpoints.txt                  // Find Endpoints
4. cat httpx.txt | katana -jc >> Enpoints.txt                           // Find More Endpoints  
5. cat Enpoints.txt | uro >> Endpoints_F.txt                            // Remove Duplicates
6. cat Endpoints_F.txt | gf xss >> XSS.txt                              // Filter Endpoints for XSS
7. cat XSS.txt | Gxss -p khXSS -o XSS_Ref.txt                           // Find reflected Parameters
8. dalfox file XSS_Ref.txt -o Vulnerable_XSS.txt                        // Find XSS
