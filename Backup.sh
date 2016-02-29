#! /bin/bash 
cd /home/nevermind/Bureau/backup #Folder where the backups are stored.

file_count=$(ls | wc -l) # Count the sum of files in the folder.

max_file=6 # Max of files authorized in the folder you adapt this value for your needs

#Name of the backup, i used the command  date +%X for display the hour on a specific fomat (00:00:00).
#it can modify just tap date --help on your shell to see all format available.
name=/home/nevermind/Bureau/backup/$(date +%X).tar 
#The confition that will delete the oldest file if the file_count will be greater than max_file authorized
if [ "$file_count" -gt "$max_file" ]; then
	rm -rf $(find -type f -printf '%T+ %p\n' | sort | head -n 1)
	echo Old Backup Deleted And New Backup Success
fi
#Tar commade which used to compress files or folders in .tar format files it takes the path an name of the Archive, and the path of the folder to Archive
tar -czf $name /var/www
echo Backup Success

