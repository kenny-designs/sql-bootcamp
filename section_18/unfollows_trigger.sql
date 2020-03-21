DELIMITER $$

CREATE TRIGGER capture_unfollow
  AFTER DELETE ON follows FOR EACH ROW
  BEGIN
    INSERT INTO unfollows
    -- similar to the INSERT INTO syntax. Just another way to do it
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
  END;

$$

DELIMITER ;
