#
## Copyright:: Copyright (c) 2017 GitLab B.V.
## License:: Apache License, Version 2.0
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
#

name 'libre2'
default_version '2016-02-01'

license 'BSD'
license_file 'LICENSE'

skip_transitive_dependency_licensing true

version '2016-02-01' do
  source sha256: 'f246c43897ac341568a7460622138ec0dd8de9b6f5459686376fa23e9d8c1bb8'
end

source url: "https://github.com/google/re2/archive/#{version}.tar.gz"

relative_path "re2-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  make "-j #{workers}", env: env
  make "install prefix=#{install_dir}/embedded", env: env
end
