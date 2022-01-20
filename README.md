# KNOT & UNKNOT
`knot` and `unknot` are simple bash script wrappers for 7zip.  
Just wanted a quick (lazy) way to simple compress and encrypt a file or group of files. Who has time to remember more command arguments? XD. 
It uses AES256 (7zip default for .7f files), encrypt files headers to hide file structure and it deletes original files after completing the job.  


## USAGE: knot
`knot [file|folder|file1 file2 folder3...]`
* Type output filename [first filename as default]
* Type password, repeat.
* Profit

## USAGE: unknot
`unknot [file.7z]`
* Type your password
* Profit

## EXAMPLE

$# `ls`  
file1 file2 file3 folder1 folder2

$# `knot file1 file3 folder2`  
Output filename [file1]: myfiles  
Enter your password: password@1  
Repeat your password: password@1  

$# `ls`  
file2 folder1 myfiles.7z  

$# `unknot myfiles.7z`  
Enter your password: password@1  
  
$# `ls`  
file1 file2 file3 folder1 folder2  
  
## INSTALLATION
`curl https://git.zhconsultores.com/oswaldo/Cifrar/raw/branch/master/installer.sh | bash`

## REQUIREMENTS
* Debian buster / Ubuntu 18 or older
* MacOS (brew installed, tested on Monterey)
* Manjaro 
