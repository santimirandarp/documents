# OpenSSL & OpenSSH
Cryptography library to generate private and public keys.


Two most widely used digital signature algorithms used in SSL/TLS: ECDSA & RSA.

```f(key, text) = ciphertext```

## Use OpenSSL for
 o  Creation and management of private keys, public keys and parameters
 o  Creation of X.509 certificates, CSRs and CRLs
 o  Encryption and Decryption with Ciphers

## Use OpenSSH
* Generate keypairs 
* Use keys to encrypt communication

## Configuration
OpenSSL: `/usr/lib/ssl/` symlink to `/etc/ssl`
OpenSSH:`/etc/ssh`, `/etc/sshd/..`

Binaries at: `/usr/bin/openssl` and `/usr/bin/ssh` (non essential binaries). 

`openssl version -a`

## File Formats
PEM (privacy enhanced mail) is a file format for storing general cryptgraphic information, but other file formats exist. PEM can be used to store private keys, certificates, or the text of an email that you want to encrypt or sign. It's just "cryptographic stuff". 

## Differences with openssh key generation
For/From OpenSSH:

> ssh-keygen(1): write OpenSSH format private keys by default instead of using OpenSSL's PEM format. Offers better protection against offline password guessing and supports key comments in private keys. If necessary, it is possible to write old PEM-style keys by adding "-m PEM" to ssh-keygen's arguments when generating or updating a key. [2018]


## Concepts
**Block** key and message is the number of bits of the key, or the ciphertext (encrypted message).

Large message block sizes are faster, large key block sizes are more secure.

DES encripts 64 bits of plain text (64bit block size), with 54 bit key.

AES uses 128,192,256 bits keys, and encodes 128-block of text (cipher).

## Types of encryption
```
openssl enc -ciphers #or
openssl list -cipher-algorithms
```
* Symmetric Crypto: each user has single key for enc & dec. It's faster than assymetric encription. But each user would need a new key. Server and client exchange the key. The problem is how to share that key without being discovered.

The symmetric encryption method works great for fast encryption of large data.

Examples: 
AES, RC4, DES, 3DES, RC5, RC6, etc. DES (data encryption standard) was superseeeded by AES (advanced encryption standard), a common standard.

DES (cracked) was used on TLS1.0 and 1.1; superseeded by 3DES also deprecated in 2019. Now AES is used in wifi protected access (wpa), tls/ssl (websites), file encription, VPNs.

* Asymmetric Crypto: Common ones are RSA, diffie-hellman, ECC, etc.

Each user has 2 keys, they share the public, and keep the private. 
One signs with the other person public key and the other person cracks using its own the private key. Asymmetric encryption method is also known as "public key cryptography.", part of pki (public key infraestructure).

Asymmetric encryption (particularly RSA) is used in many communication protocols / transport layers: TLS/SSL, SSH, Cryptocurrencies, Email, etc.

* It protects -partially- against MITM attacks bcz we don't exchange the private key. 
* Public key cryptography allows creating an encrypted connection without having to meet offline to exchange keys first. (Again, bcz we exchange public key, not private/single key). 
* Also, the server needs a single key-pair!

## What do websites actually use
Hybrid encryption: Asymmetric and Symmetric. RSA for starting the comm and exchanging the Private symmetric key. This is bcz symmetric cryptography is faster.

## Example: Generating RSA private key
```
openssl genpkey -aes256 -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private-key.pem
```
* Generate private key  
* sym enc for pkey -aes256 (key from passphrase)
* Generate it using asymmetric encryption RSA
* 256 bits private key 
* Output to private-key.pem (from privacy enhanced mail)

It will ask for a passphrase (we can press enter or even remove -aes256 is we don't want it).

## Encoding and decoding files
