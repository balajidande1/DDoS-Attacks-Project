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