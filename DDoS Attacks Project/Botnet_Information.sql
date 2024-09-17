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