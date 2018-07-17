[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=simple
User=appuser
WorkingDirectory=/home/appuser/reddit
Environment=DATABASE_URL=${reddit_db_ip}:27017
ExecStart=/bin/bash -lc 'puma'
Restart=always

[Install]
WantedBy=multi-user.target
