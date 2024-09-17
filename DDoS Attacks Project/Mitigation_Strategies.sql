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