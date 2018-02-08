Konfigurasi backup MySQL dari SSH (Bash) 
1. ssh-keygen
2. ssh-copy-id -i ~/.ssh/id_rsa.pub username_ssh@domain.com 
3. Buat file backup di /opt/backupmysql.sh
4. Isi file:
#!/bin/bash
echo "Menghubungkan ke server";
ssh username_ssh@domain.com -t 'mysqldump -u username_mysql -pPasswdMysql --all-databases > /home/user/homes/mysqlbackup.sql;exit';
echo "Ambil file backup";
scp usernam_ssh@domain.com:/home/username/homes/mysqlbackup.sql /home/userlocalanda/mysql_$(date +%Y%m%d_%H%M%S).sql;
echo "Selesai Backup ..";
5. Simpan dan buat persimission execute dengan cara chmod +x /opt/backupmysql.sh     
6. Buat cron untuk execute  /opt/backupmysql.sh                                                                                               
