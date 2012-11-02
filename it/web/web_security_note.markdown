1. FTP is bad，Telnet is bad；SFTP is good，SSH is good. SFTP is FTP
over SSH

2. http://validator.w3.org/ validate front-end compliance with XHTML1.0
or not.

3. Fast CGI or suPHP can fixible control run codes permission and codes
access.

4. 服务器之所以会记住你登录了某个网站是因为你的cookie与服务器给你的相对应，而不是因为记住了你的IP或硬件信息（通常不会检测IP，只认cookie中的session id），session劫持就是在cookie中偷走了你的session ID，然后出示给服务器以冒充你，即使检测了IP，也不一定安全。firesheep的工作原理也是如此。

5. http和https之间显著的区别在于：前者发送的cookie是明文的，而后者则是密文的。

6. 所有的网站都该加上SSL。
