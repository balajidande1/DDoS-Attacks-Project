create database Attack_Detection;
use Attack_Detection;

### 1. *Create Table Queries*

-- Table for attacks
CREATE TABLE attacks (
    id INT PRIMARY KEY,
    attack_type INT,
    attack_date DATETIME,
    source_ip VARCHAR(15),
    FOREIGN KEY (attack_type) REFERENCES attack_detection.attack_types(id),
    FOREIGN KEY (source_ip) REFERENCES attack_detection.sources(source_ip)
);

-- Table for attack types
CREATE TABLE attack_types (
    id INT PRIMARY KEY,
    type_name VARCHAR(50),
    description VARCHAR(255)
);

-- Table for sources
CREATE TABLE sources (
    id INT PRIMARY KEY,
    source_ip VARCHAR(15) UNIQUE,
    source_country VARCHAR(50)
);

-- Table for detection rules
CREATE TABLE detection_rules (
    id INT PRIMARY KEY,
    rule_name VARCHAR(50),
    rule_description VARCHAR(255)
);

-- Table for alerts
CREATE TABLE alerts (
    id INT PRIMARY KEY,
    attack_id INT,
    alert_date DATETIME,
    alert_level VARCHAR(50),
    FOREIGN KEY (attack_id) REFERENCES attacks(id)
);


### 2. *Insert Data Queries*

#### Inserting data into attack_types table:

INSERT INTO attack_types (id, type_name, description) VALUES
(1, 'DDoS', 'Distributed Denial of Service'),
(2, 'SQL Injection', 'Structured Query Language Injection'),
(3, 'Cross-Site Scripting', 'XSS'),
(4, 'Brute Force', 'Password Guessing'),
(5, 'Phishing', 'Social Engineering');


#### Inserting data into sources table:

INSERT INTO sources (id, source_ip, source_country) VALUES
(1, '192.168.1.100', 'USA'),
(2, '192.168.1.101', 'China'),
(3, '192.168.1.102', 'Russia'),
(4, '192.168.1.103', 'India'),
(5, '192.168.1.104', 'Brazil');


#### Inserting data into attacks table:

INSERT INTO attacks (id, attack_type, attack_date, source_ip) VALUES
(1, 1, '2022-01-01 12:00:00', '192.168.1.100'),
(2, 2, '2022-01-02 13:00:00', '192.168.1.101'),
(3, 3, '2022-01-03 14:00:00', '192.168.1.102'),
(4, 1, '2022-01-04 15:00:00', '192.168.1.103'),
(5, 2, '2022-01-05 16:00:00', '192.168.1.104');


#### Inserting data into detection_rules table:

INSERT INTO detection_rules (id, rule_name, rule_description) VALUES
(1, 'Rule 1', 'Detect DDoS attacks'),
(2, 'Rule 2', 'Detect SQL Injection'),
(3, 'Rule 3', 'Detect XSS'),
(4, 'Rule 4', 'Detect Brute Force'),
(5, 'Rule 5', 'Detect Phishing');


#### Inserting data into alerts table:

INSERT INTO alerts (id, attack_id, alert_date, alert_level) VALUES
(1, 1, '2022-01-01 12:00:00', 'High'),
(2, 2, '2022-01-02 13:00:00', 'Medium'),
(3, 3, '2022-01-03 14:00:00', 'Low'),
(4, 4, '2022-01-04 15:00:00', 'High'),
(5, 5, '2022-01-05 16:00:00', 'Medium');

create database Network_Traffic;
use Network_Traffic;

-- Create the traffic table
CREATE TABLE traffic (
    id INT PRIMARY KEY,
    timestamp TIMESTAMP,
    source_ip VARCHAR(15),
    destination_ip VARCHAR(15),
    protocol INT,
    FOREIGN KEY (protocol) REFERENCES protocols(id)
);

-- Create the protocols table
CREATE TABLE protocols (
    id INT PRIMARY KEY,
    protocol_name VARCHAR(20),
    description VARCHAR(100)
);

-- Create the ip_addresses table
CREATE TABLE ip_addresses (
    id INT PRIMARY KEY,
    ip_address VARCHAR(15),
    ip_type VARCHAR(10)
);

-- Create the network_devices table
CREATE TABLE network_devices (
    id INT PRIMARY KEY,
    device_name VARCHAR(50),
    device_type VARCHAR(20)
);

-- Create the traffic_stats table
CREATE TABLE traffic_stats (
    id INT PRIMARY KEY,
    timestamp TIMESTAMP,
    traffic_volume BIGINT
);

-- Insert 5 records into protocols table
INSERT INTO protocols (id, protocol_name, description) VALUES
(1, 'HTTP', 'Hypertext Transfer Protocol'),
(2, 'HTTPS', 'Hypertext Transfer Protocol Secure'),
(3, 'FTP', 'File Transfer Protocol'),
(4, 'SSH', 'Secure Shell'),
(5, 'DNS', 'Domain Name System');

-- Insert 5 records into ip_addresses table
INSERT INTO ip_addresses (id, ip_address, ip_type) VALUES
(1, '192.168.0.1', 'Private'),
(2, '8.8.8.8', 'Public'),
(3, '10.0.0.1', 'Private'),
(4, '172.16.0.1', 'Private'),
(5, '203.0.113.1', 'Public');

-- Insert 5 records into network_devices table
INSERT INTO network_devices (id, device_name, device_type) VALUES
(1, 'Router1', 'Router'),
(2, 'Switch1', 'Switch'),
(3, 'Firewall1', 'Firewall'),
(4, 'Access Point1', 'Access Point'),
(5, 'Router2', 'Router');

-- Insert 5 records into traffic table
INSERT INTO traffic (id, timestamp, source_ip, destination_ip, protocol) VALUES
(1, '2024-09-17 10:00:00', '192.168.0.1', '8.8.8.8', 1),
(2, '2024-09-17 10:05:00', '10.0.0.1', '203.0.113.1', 2),
(3, '2024-09-17 10:10:00', '172.16.0.1', '8.8.8.8', 3),
(4, '2024-09-17 10:15:00', '192.168.0.1', '203.0.113.1', 4),
(5, '2024-09-17 10:20:00', '10.0.0.1', '172.16.0.1', 5);

-- Insert 5 records into traffic_stats table
INSERT INTO traffic_stats (id, timestamp, traffic_volume) VALUES
(1, '2024-09-17 10:00:00', 5000),
(2, '2024-09-17 10:05:00', 7000),
(3, '2024-09-17 10:10:00', 3000),
(4, '2024-09-17 10:15:00', 8000),
(5, '2024-09-17 10:20:00', 4000);

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

create database botnet_information;
USE botnet_information;
-- Create botnets table
CREATE TABLE botnets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  botnet_name VARCHAR(100) NOT NULL,
  description TEXT,
  creation_date DATE
);

-- Create botnet_nodes table
CREATE TABLE botnet_nodes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  botnet_id INT NOT NULL,
  node_ip VARCHAR(45),
  node_status VARCHAR(50),
  FOREIGN KEY (botnet_id) REFERENCES botnets(id) ON DELETE CASCADE
);

-- Create command_and_control table
CREATE TABLE command_and_control (
  id INT AUTO_INCREMENT PRIMARY KEY,
  botnet_id INT NOT NULL,
  cc_ip VARCHAR(45),
  cc_domain VARCHAR(255),
  FOREIGN KEY (botnet_id) REFERENCES botnets(id) ON DELETE CASCADE
);

-- Create botnet_attacks table
CREATE TABLE botnet_attacks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  botnet_id INT NOT NULL,
  attack_type VARCHAR(50),
  attack_date DATETIME,
  FOREIGN KEY (botnet_id) REFERENCES botnets(id) ON DELETE CASCADE
);

-- Create botnet_vulnerabilities table
CREATE TABLE botnet_vulnerabilities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  botnet_id INT NOT NULL,
  vulnerability_description TEXT,
  FOREIGN KEY (botnet_id) REFERENCES botnets(id) ON DELETE CASCADE
);
-- Insert data into botnets table
INSERT INTO botnets (botnet_name, description, creation_date) VALUES 
('Mirai', 'A botnet that primarily targets IoT devices', '2016-08-01'),
('Emotet', 'A modular botnet used for spamming and credential theft', '2014-06-01'),
('Necurs', 'A botnet famous for its use in distributing ransomware', '2012-01-01'),
('Zeus', 'A botnet used for stealing financial information', '2007-07-01'),
('Sality', 'A botnet known for its peer-to-peer communication and malware distribution', '2003-04-01');

-- Insert data into botnet_nodes table
INSERT INTO botnet_nodes (botnet_id, node_ip, node_status) VALUES 
(1, '192.168.1.10', 'active'),
(1, '192.168.1.11', 'inactive'),
(2, '172.16.1.100', 'active'),
(3, '10.0.0.10', 'active'),
(4, '192.168.2.200', 'active');

-- Insert data into command_and_control table
INSERT INTO command_and_control (botnet_id, cc_ip, cc_domain) VALUES 
(1, '203.0.113.5', 'mirai-cc.com'),
(2, '198.51.100.1', 'emotet-cc.org'),
(3, '192.0.2.1', 'necurs-cc.net'),
(4, '203.0.113.10', 'zeus-cc.org'),
(5, '198.51.100.20', 'sality-cc.com');

-- Insert data into botnet_attacks table
INSERT INTO botnet_attacks (botnet_id, attack_type, attack_date) VALUES 
(1, 'DDoS', '2023-08-01 14:00:00'),
(2, 'Spam Campaign', '2023-07-15 09:00:00'),
(3, 'Ransomware Delivery', '2023-06-30 12:00:00'),
(4, 'Credential Theft', '2023-05-20 16:30:00'),
(5, 'Malware Distribution', '2023-04-10 18:45:00');

-- Insert data into botnet_vulnerabilities table
INSERT INTO botnet_vulnerabilities (botnet_id, vulnerability_description) VALUES 
(1, 'Exploits weak passwords in IoT devices'),
(2, 'Exploits vulnerabilities in Microsoft Office documents'),
(3, 'Exploits the MS17-010 vulnerability'),
(4, 'Exploits banking software weaknesses'),
(5, 'Exploits peer-to-peer communication weaknesses');
SELECT * FROM botnets;
SELECT * FROM botnet_nodes;
SELECT * FROM command_and_control;
SELECT * FROM botnet_attacks;
SELECT * FROM botnet_vulnerabilities;

CREATE DATABASE Mitigation_Strategies;
USE Mitigation_Strategies;
-- Create mitigation_methods table
CREATE TABLE mitigation_methods (
  id INT AUTO_INCREMENT PRIMARY KEY,
  method_name VARCHAR(100) NOT NULL,
  description TEXT
);

-- Create mitigation_rules table
CREATE TABLE mitigation_rules (
  id INT AUTO_INCREMENT PRIMARY KEY,
  method_id INT NOT NULL,
  rule_description TEXT,
  FOREIGN KEY (method_id) REFERENCES mitigation_methods(id) ON DELETE CASCADE
);

-- Create incident_responses table
CREATE TABLE incident_responses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  incident_id INT NOT NULL,
  response_time DATETIME,
  response_details TEXT
);

-- Create strategy_effectiveness table
CREATE TABLE strategy_effectiveness (
  id INT AUTO_INCREMENT PRIMARY KEY,
  method_id INT NOT NULL,
  evaluation_date DATE,
  effectiveness_score INT,
  FOREIGN KEY (method_id) REFERENCES mitigation_methods(id) ON DELETE CASCADE
);

-- Create response_teammembers table
CREATE TABLE response_teammembers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(50),
  contact_info VARCHAR(255)
);
-- Insert data into mitigation_methods table
INSERT INTO mitigation_methods (method_name, description) VALUES 
('DDoS Mitigation', 'Methods to prevent and stop Distributed Denial of Service attacks'),
('Phishing Protection', 'Strategies to prevent and detect phishing attacks'),
('Ransomware Defense', 'Techniques to defend against ransomware'),
('Firewall Rules', 'Rules for network firewalls to block malicious traffic'),
('Data Encryption', 'Encryption techniques to protect data in transit and at rest');

-- Insert data into mitigation_rules table
INSERT INTO mitigation_rules (method_id, rule_description) VALUES 
(1, 'Rate limiting to reduce traffic load'),
(2, 'Filter emails based on known phishing signatures'),
(3, 'Use endpoint protection to detect ransomware activities'),
(4, 'Allow only known IP addresses to access the network'),
(5, 'Encrypt all communication channels using TLS');

-- Insert data into incident_responses table
INSERT INTO incident_responses (incident_id, response_time, response_details) VALUES 
(1001, '2024-09-15 10:30:00', 'DDoS attack mitigated by rate limiting and traffic rerouting'),
(1002, '2024-09-10 14:15:00', 'Phishing email detected and quarantined by email filter'),
(1003, '2024-09-05 09:45:00', 'Ransomware detected and isolated through endpoint protection'),
(1004, '2024-08-30 11:00:00', 'Unauthorized access attempt blocked by firewall rule'),
(1005, '2024-08-25 13:20:00', 'Sensitive data encrypted before transmission');

-- Insert data into strategy_effectiveness table
INSERT INTO strategy_effectiveness (method_id, evaluation_date, effectiveness_score) VALUES 
(1, '2024-09-16', 85),
(2, '2024-09-15', 90),
(3, '2024-09-14', 78),
(4, '2024-09-12', 92),
(5, '2024-09-10', 88);

-- Insert data into response_teammembers table
INSERT INTO response_teammembers (name, role, contact_info) VALUES 
('John Doe', 'Incident Responder', 'john.doe@example.com'),
('Jane Smith', 'Security Analyst', 'jane.smith@example.com'),
('Alan Turing', 'Threat Intelligence Expert', 'alan.turing@example.com'),
('Grace Hopper', 'Network Administrator', 'grace.hopper@example.com'),
('Ada Lovelace', 'Data Security Specialist', 'ada.lovelace@example.com');
SELECT * FROM mitigation_methods;
SELECT * FROM mitigation_rules;
SELECT * FROM incident_responses;
SELECT * FROM strategy_effectiveness;
SELECT * FROM response_teammembers;
