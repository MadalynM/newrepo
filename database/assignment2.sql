/**** New Record to account table *****/
INSERT INTO public.account
  ( account_firstname, account_lastname, account_email, account_password )
VALUES
  ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n')

/***** Modify account_type to admin ******/
UPDATE public.account
SET account_type = 'Admin' 
WHERE account_id = 1

/****** Delete Tony Start *****/
DELETE FROM public.account
WHERE account_id = 1

/****** Modify GM Hummer Record ******/
UPDATE public.inventory 
SET inv_description = REPLACE( inv_description, 'the small interiors', 'a huge interior' )
WHERE inv_id = 10

/***** Inner Join Sport Models ******/
SELECT 
  inventory.classification_id, 
  classification.classification_id,
  inv_make, 
  inv_model, 
  classification_name 
FROM public.inventory
INNER JOIN public.classification 
  ON inventory.classification_id = classification.classification_id
WHERE inventory.classification_id = 2;

/****** Update Image and Thumbnail *****/
UPDATE public.inventory 
SET 
  inv_image = REPLACE( inv_image, 's/', 's/vehicles/' ), 
  inv_thumbnail = REPLACE( inv_thumbnail, 's/', 's/vehicles/');