# Create a sample gpg directory with a user key

if [ -z "$GNUPGHOME" ]; then
  echo "ERROR: Must set \$GNUPGHOME to directory where to generate test gpg key"
  exit 1
fi

# create gpg key to sign tag
mkdir gpg
# Prepare a gpg test key based on a batch config
cat >"$GNUPGHOME/gen-key.conf" <<'EOF'
%no-protection
Key-Type: RSA
Key-Length: 2048
Subkey-Type: RSA
Subkey-Length: 2048
Name-Real: Test User
Name-Email: test@example.com
Expire-Date: 1d
%commit
EOF
gpg --batch --gen-key "$GNUPGHOME/gen-key.conf"
