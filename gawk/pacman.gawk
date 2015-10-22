# pacman.gawk - Converts output of 'pacman -Qi' into SQLite  pacman table
# 
# Can be used in like this:
# shell> gawk -f ./pacman.gawk ./tmp > ./sql; sqlite3 -init ./sql
# sqlite> SELECT package, descr FROM pacman WHERE install_reason LIKE 'Explicit%' AND groups NOT LIKE '%xorg%' AND groups NOT LIKE '%base%' ORDER BY package;

BEGIN { 
 if (ARGC!=2) {
  print "Must have tmp file argument"
  exit
 }
 tmp=ARGV[ARGC-1] 
 command = "/usr/bin/pacman -Qi > " tmp
 if (system(command)!=0) {
  print "Error executing command: " command
  exit
 }
}

BEGINFILE {
 RS="\n\n"
 FS="\n"
 OFS=","
 print "DROP TABLE IF EXISTS pacman;"
 print "CREATE TABLE pacman (package, version, descr, arch, url, licenses, groups, provides, depends, optional_depends, required_by, optional_for, conflicts_with, replaces, installed_size, packager, build_date, install_date, install_reason, install_script, validated_by);"
}

# Optional Deps may be multiline
{ gsub("\n +", " ") }

{
 for (i=1;i<=NF;i++) {
  gsub("\"","",$i)
  $i = "\"" substr($i, index($i,":")+2) "\""
 }
 print "INSERT INTO pacman SELECT " $0 ";"
}
