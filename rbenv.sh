curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
export RBENV_ROOT="${HOME}/.rbenv"
mv "${HOME}/.bashrc" "${HOME}/.bashrc_old"
cat > "${HOME}/.bashrc" << EOF
if [ -d "\${RBENV_ROOT}" ]; then
  export PATH="\${RBENV_ROOT}/bin:\${PATH}"
  eval "\$(rbenv init -)"
fi
EOF
cat "${HOME}/.bashrc_old" >> "${HOME}/.bashrc"
rm "${HOME}/.bashrc_old"

cat > "${HOME}/.gemrc" << EOF
---
:verbose: true
:backtrace: false
gem: --no-ri --no-rdoc
EOF

source "${HOME}/.bashrc"
rbenv bootstrap-ubuntu-12-04
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
gem install bundler --no-ri --no-rdoc
rbenv rehash
