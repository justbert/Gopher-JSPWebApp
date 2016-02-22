use gopher;

ALTER TABLE tasks
	DROP COLUMN category;

ALTER TABLE tasks
	DROP COLUMN reward;

ALTER TABLE tasks
	ADD COLUMN dateCreated TIMESTAMP;
	
ALTER TABLE tasks
	ADD COLUMN taskName VARCHAR(50);
	
ALTER TABLE tasks
	ADD COLUMN taskDescription VARCHAR(100);
	
ALTER TABLE transactions
	ADD COLUMN category VARCHAR(50);

ALTER TABLE transactions
	ADD COLUMN reward VARCHAR(50);