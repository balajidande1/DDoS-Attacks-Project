create database System_logging;
use System_logging;


### 1. **Create and Insert for log_levels**

#### Create Table

CREATE TABLE log_levels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level_name VARCHAR(50),
    description TEXT
);
select * from log_levels;

#### Insert Data

INSERT INTO log_levels (level_name, description) VALUES
('INFO', 'Informational messages'),
('WARN', 'Warning conditions'),
('ERROR', 'Error conditions'),
('DEBUG', 'Debug-level messages'),
('FATAL', 'Critical system errors requiring immediate attention');


---

### 2. **Create and Insert for log_sources**

#### Create Table

CREATE TABLE log_sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(100),
    source_type VARCHAR(50),
    description TEXT
);
select * from log_sources;

#### Insert Data

INSERT INTO log_sources (source_name, source_type, description) VALUES
('System Core', 'System', 'Logs from the system core processes'),
('User Manager', 'Service', 'Logs from the user management service'),
('Security Monitor', 'Security', 'Logs from the security monitoring system'),
('Database Engine', 'Database', 'Logs from the database processes'),
('Network Interface', 'Network', 'Logs from network interfaces');


---

### 3. **Create and Insert for system_logs**

#### Create Table

CREATE TABLE system_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp DATETIME,
    log_level VARCHAR(10),
    message TEXT,
    source VARCHAR(100),
    FOREIGN KEY (log_level) REFERENCES log_levels(level_name),
    FOREIGN KEY (source) REFERENCES log_sources(source_name)

);
select * from system_logs;

#### Insert Data

INSERT INTO system_logs (timestamp, log_level, message, source) VALUES
('2024-01-01 12:00:00', 'INFO', 'System started successfully', 'System Core'),
('2024-01-02 14:30:00', 'WARN', 'High memory usage detected', 'System Core'),
('2024-01-02 15:00:00', 'ERROR', 'Failed to connect to database', 'Database Engine'),
('2024-01-03 10:45:00', 'DEBUG', 'User login attempt', 'User Manager'),
('2024-01-03 11:30:00', 'FATAL', 'System crash detected', 'System Core');


---

### 4. **Create and Insert for system_events**

#### Create Table

CREATE TABLE system_events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_type VARCHAR(50),
    event_timestamp DATETIME,
    event_description TEXT
);


#### Insert Data

INSERT INTO system_events (event_type, event_timestamp, event_description) VALUES
('Reboot', '2024-01-01 12:00:00', 'System rebooted for maintenance'),
('Login', '2024-01-03 10:45:00', 'User login attempt'),
('Backup', '2024-01-02 02:00:00', 'Scheduled system backup completed'),
('Patch', '2024-01-03 08:00:00', 'Security patch applied'),
('Shutdown', '2024-01-03 11:30:00', 'System shut down due to critical error');


---

### 5. **Create and Insert for user_activity**

#### Create Table

CREATE TABLE user_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(50),
    activity_timestamp DATETIME,
    description TEXT
);


#### Insert Data

INSERT INTO user_activity (user_id, activity_type, activity_timestamp, description) VALUES
(1, 'Login', '2024-01-03 10:45:00', 'User logged in from IP 192.168.1.1'),
(2, 'File Upload', '2024-01-03 11:00:00', 'User uploaded a file to the server'),
(3, 'Logout', '2024-01-03 11:30:00', 'User logged out'),
(4, 'Password Change', '2024-01-02 16:00:00', 'User changed password'),
(5, 'Login', '2024-01-04 09:00:00', 'User logged in from IP 192.168.1.2');