/*
This file is part of Giswater
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


-- ----------------------------
-- View structure for v_edit_man_node
-- ----------------------------

CREATE VIEW "SCHEMA_NAME"."v_edit_man_junction" AS 
SELECT 
node.node_id, node.elevation, node."depth", node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate, node.ownercat_id,
man_junction.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node
JOIN SCHEMA_NAME.man_junction ON (((man_junction.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_tank" AS 
SELECT 
node.node_id, node.elevation, node."depth", node.nodecat_id,
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate,  node.ownercat_id,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node 
JOIN SCHEMA_NAME.man_tank ON (((man_tank.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_hydrant" AS 
SELECT 
node.node_id, node.elevation, node."depth", node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate,  node.ownercat_id,
man_hydrant.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node 
JOIN SCHEMA_NAME.man_hydrant ON (((man_hydrant.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_valve" AS 
SELECT 
node.node_id, node.elevation, node."depth", node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate, node.ownercat_id, 
man_valve.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node
JOIN SCHEMA_NAME.man_valve ON (((man_valve.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_pump" AS 
SELECT 
node.node_id, node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate, node.ownercat_id, 
man_pump.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node 
JOIN SCHEMA_NAME.man_pump ON (((man_pump.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_filter" AS 
SELECT 
node.node_id, node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate, node.ownercat_id, 
man_filter.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node 
JOIN SCHEMA_NAME.man_filter ON (((man_filter.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));


CREATE VIEW "SCHEMA_NAME"."v_edit_man_meter" AS 
SELECT 
node.node_id, node.elevation, node."depth", node.nodecat_id, 
cat_node.nodetype_id AS "cat.nodetype",
node.sector_id, node."state", node.annotation, node.observ, node.comment, node.dma_id, node.soilcat_id, node.category_type, node.fluid_type, node.location_type, node.workcat_id, node.buildercat_id, node.builtdate,  node.ownercat_id,
man_meter.add_info,
cat_node.svg AS "cat.svg",
node.rotation, node.link, node.verified, node.the_geom
FROM (SCHEMA_NAME.node
JOIN SCHEMA_NAME.man_meter ON (((man_meter.node_id)::text = (node.node_id)::text))
JOIN "SCHEMA_NAME".cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text)));



-- ----------------------------
-- View structure for v_edit_man_arc
-- ----------------------------

CREATE VIEW "SCHEMA_NAME"."v_edit_man_pipe" AS 
SELECT 
arc.arc_id, arc.arccat_id, 
cat_arc.arctype_id AS "cat.arctype",
arc.sector_id, arc."state", arc.annotation, arc.observ, arc.comment, st_length2d(arc.the_geom)::numeric(12,2) AS gis_length, arc.custom_length, arc.dma_id, arc.soilcat_id, arc.category_type, arc.fluid_type, arc.location_type, arc.workcat_id, arc.buildercat_id, arc.builtdate, arc.ownercat_id, 
man_pipe.add_info,
cat_arc.svg AS "cat.svg",
arc.rotation, arc.link, arc.verified, arc.the_geom
FROM (SCHEMA_NAME.arc 
JOIN SCHEMA_NAME.man_pipe ON (((man_pipe.arc_id)::text = (arc.arc_id)::text))
JOIN "SCHEMA_NAME".cat_arc ON (((arc.arccat_id)::text = (cat_arc.id)::text)));



-----------------------------
-- TRIGGERS EDITING VIEWS FOR EDIT MAN NODE
-----------------------------

CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_junction() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 

BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
		
--	Control insertions ID	
	IF TG_OP = 'INSERT' THEN

--			Node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;
			
--			elevation, depth
			IF (NEW.elevation IS NULL) THEN 
			    NEW.elevation = 0;
			END IF;
			
			IF (NEW.depth IS NULL) THEN 
			    NEW.depth = 0;
			END IF;
			
--			Node Catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;
			
--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
			
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;	

--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;	

--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;
		
-- FEATURE INSERT
		INSERT INTO node 		      VALUES (NEW.node_id, NEW.elevation, NEW."depth", NEW.nodecat_id, 'JUNCTION'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment",
										      NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 	
											  null, null, null, null, null,
											  NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_junction VALUES (NEW.node_id, NEW.add_info);

-- EPA INSERT
		querystring := (SELECT epa_table FROM node_type JOIN cat_node ON (((node_type.id)::text = (cat_node.nodetype_id)::text)) WHERE cat_node.id=NEW.nodecat_id);
		IF (querystring='inp_junction') THEN INSERT INTO  inp_junction VALUES(NEW.node_id, null, null);
		ELSIF (querystring='inp_reservoir') THEN INSERT INTO  inp_reservoir VALUES(NEW.node_id, null, null);
		END IF;
		RETURN NEW;

	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 		     SET node_id=NEW.node_id, elevation=NEW.elevation, "depth"=NEW."depth", nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation=NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment", 
							      	 dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
									 rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_junction SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
       RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 				WHERE node_id=OLD.node_id;
		DELETE FROM man_junction 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;


 
CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_tank() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 

BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	
--	Control insertions ID	
	IF TG_OP = 'INSERT' THEN
	
--			Node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;

--			elevation, depth
			IF (NEW.elevation IS NULL) THEN 
			    NEW.elevation = 0;
			END IF;
			
			IF (NEW.depth IS NULL) THEN 
			    NEW.depth = 0;
			END IF;
		
--			Node Catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;
			
--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;			
				
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;		
			
--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;	
			
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;

-- FEATURE INSERT
		INSERT INTO node 		  VALUES (NEW.node_id, NEW.elevation, NEW."depth", NEW.nodecat_id, 'TANK'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment",
										  NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
										  null, null, null, null, null, 
										  NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);

-- MANAGEMENT INSERT
		INSERT INTO man_tank VALUES (NEW.node_id, NEW.vmax, NEW.area, NEW.add_info);

-- EPA INSERT
		INSERT INTO  inp_tank VALUES(NEW.node_id,null, null, null, null, null, null);
		
		RETURN NEW;

	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 		 SET node_id=NEW.node_id, elevation=NEW.elevation, "depth"=NEW."depth", nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation=NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment",
								 dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
								 rotation=NEW.rotation,link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_tank SET node_id=NEW.node_id, vmax=NEW.vmax, area=NEW.area, add_info=NEW.add_info WHERE node_id=OLD.node_id;
       RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 			WHERE node_id=OLD.node_id;
		DELETE FROM man_tank 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;

 
  

CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_hydrant() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

--	Control insertions ID	
	IF TG_OP = 'INSERT' THEN
	
--			Node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;
			
--			elevation, depth
			IF (NEW.elevation IS NULL) THEN 
			    NEW.elevation = 0;
			END IF;
			
			IF (NEW.depth IS NULL) THEN 
			    NEW.depth = 0;
			END IF;
			
--			Node Catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;
			
--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
				
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;		
			
--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;	
			
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;

-- FEATURE INSERT
		INSERT INTO node 		      VALUES (NEW.node_id, NEW.elevation, NEW."depth", NEW.nodecat_id, 'JUNCTION'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment",
										      NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
											  null, null, null, null, null, 
											  NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_hydrant  VALUES (NEW.node_id, NEW.add_info);

-- EPA INSERT
		INSERT INTO  inp_junction VALUES(NEW.node_id, null, null);
		
		RETURN NEW;

	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 		     SET node_id=NEW.node_id, elevation=NEW.elevation, "depth"=NEW."depth", nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation=NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment",
							      	 dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate,
									 rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_hydrant  SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
       RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 				WHERE node_id=OLD.node_id;
		DELETE FROM man_hydrant 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;




CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_valve() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 	
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

--	Control insertions ID	
	IF TG_OP = 'INSERT' THEN
	
--			Node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;
			
--			elevation, depth
			IF (NEW.elevation IS NULL) THEN 
			    NEW.elevation = 0;
			END IF;
			
			IF (NEW.depth IS NULL) THEN 
			    NEW.depth = 0;
			END IF;
			
--			Node Catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;
			
--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
				
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;		

--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;		
			
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;

-- FEATURE INSERT
		INSERT INTO node 		    VALUES (NEW.node_id, NEW.elevation, NEW."depth", NEW.nodecat_id, 'JUNCTION'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment",
									        NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
											null, null, null, null, null,
											NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_valve		VALUES (NEW.node_id, NEW.add_info);

-- EPA INSERT
		querystring := (SELECT epa_table FROM node_type JOIN cat_node ON (((node_type.id)::text = (cat_node.nodetype_id)::text)) WHERE cat_node.id=NEW.nodecat_id);
		IF (querystring='inp_junction') THEN INSERT INTO  inp_junction VALUES(NEW.node_id, null, null);
		ELSIF (querystring='inp_pipe') THEN INSERT INTO  inp_nodepipe VALUES(NEW.node_id, null, null, null);
		ELSIF (querystring='inp_valve') THEN INSERT INTO  inp_valve VALUES(NEW.node_id, null, null, null, null);
		END IF;

		RETURN NEW;

	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 		  SET node_id=NEW.node_id, elevation=NEW.elevation, "depth"=NEW."depth", nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation=NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment", 
							      dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
								  rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_valve SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
       RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 			WHERE node_id=OLD.node_id;
		DELETE FROM man_valve 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;

 
  

CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_pump() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

	IF TG_OP = 'INSERT' THEN
--			node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;

--			node catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;

--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
			
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;		
			
--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	
			
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;		

-- FEATURE INSERT
		INSERT INTO node 	 		VALUES (NEW.node_id, null, null, NEW.nodecat_id, 'PIPE'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment", NEW.rotation, null,
											NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
											null, null, null, null, null, 
											NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_pump	VALUES (NEW.node_id, NEW.add_info);			 

-- EPA INSERT
		INSERT INTO  inp_pump 	VALUES(NEW.node_id, null, null, null, null, null, null);			 
									 
		RETURN NEW;
    
	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 			SET node_id=NEW.node_id, nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation= NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment",
								dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
								rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_pump SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
		RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 			WHERE node_id=OLD.node_id;
		DELETE FROM man_pump 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;



CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_filter() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

	IF TG_OP = 'INSERT' THEN
--			node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;

--			node catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;

--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
		
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;		

--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	
					
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;	

-- FEATURE INSERT
		INSERT INTO node 	 		VALUES (NEW.node_id, null, null, NEW.nodecat_id, 'PIPE'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment", null,
											NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
											null, null, null, null, null, 	
											NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_filter		VALUES (NEW.node_id, NEW.add_info);			 

-- EPA INSERT
		INSERT INTO  inp_nodepipe VALUES(NEW.node_id, null, null, null);
			 
		RETURN NEW;
    
	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 				SET node_id=NEW.node_id, nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation= NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment",
								    dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
									rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_filter 	SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
		RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 			WHERE node_id=OLD.node_id;
		DELETE FROM man_filter 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;



CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_meter() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 	
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

--	Control insertions ID	
	IF TG_OP = 'INSERT' THEN
	
--			Node ID
			IF (NEW.node_id IS NULL) THEN
				NEW.node_id := (SELECT nextval('node_id_seq'));
			END IF;
			
--			elevation, depth
			IF (NEW.elevation IS NULL) THEN 
			    NEW.elevation = 0;
			END IF;
			
			IF (NEW.depth IS NULL) THEN 
			    NEW.depth = 0;
			END IF;
			
--			Node Catalog ID
			IF (NEW.nodecat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
					RAISE EXCEPTION 'There are no nodes catalog defined in the model, define at least one.';
				END IF;			
				NEW.nodecat_id := (SELECT id FROM cat_node LIMIT 1);
			END IF;
			
--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
			
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;

--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;	

--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;
						
-- FEATURE INSERT
		INSERT INTO node 		    VALUES (NEW.node_id, NEW.elevation, NEW."depth", NEW.nodecat_id, 'JUNCTION'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment",
									        NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
										null, null, null, null, null, 
										NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_meter	VALUES (NEW.node_id, NEW.add_info);

-- EPA INSERT
		querystring := (SELECT epa_table FROM node_type JOIN cat_node ON (((node_type.id)::text = (cat_node.nodetype_id)::text)) WHERE cat_node.id=NEW.nodecat_id);
		IF (querystring='inp_junction') THEN INSERT INTO  inp_junction VALUES(NEW.node_id, null, null);
		ELSIF (querystring='inp_nodepipe') THEN INSERT INTO  inp_pipe VALUES(NEW.node_id, null, null, null);
		END IF;

		RETURN NEW;

	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE node 		  SET node_id=NEW.node_id, elevation=NEW.elevation, "depth"=NEW."depth", nodecat_id=NEW.nodecat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation=NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment",
							      dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
								  rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_meter SET node_id=NEW.node_id, add_info=NEW.add_info WHERE node_id=OLD.node_id;
       RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM node 			WHERE node_id=OLD.node_id;
		DELETE FROM man_meter 	WHERE node_id=OLD.node_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;



CREATE TRIGGER v_edit_man_junction 	INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_junction 	FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_junction();
 
CREATE TRIGGER v_edit_man_tank 		INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_tank 		FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_tank();

CREATE TRIGGER v_edit_man_hydrant 	INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_hydrant 	FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_hydrant();

CREATE TRIGGER v_edit_man_valve 	INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_valve 	FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_valve();

CREATE TRIGGER v_edit_map_pump 		INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_pump 		FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_pump();

CREATE TRIGGER v_edit_map_filter 	INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_filter 	FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_filter();

CREATE TRIGGER v_edit_man_meter 	INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_meter 	FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_meter();
  
  
  
-----------------------------
-- TRIGGERS EDITING VIEWS FOR EDIT MAN ARC
-----------------------------
  
CREATE OR REPLACE FUNCTION SCHEMA_NAME.v_edit_man_pipe() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE querystring Varchar; 
BEGIN

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	
	IF TG_OP = 'INSERT' THEN
--			Arc ID
			IF (NEW.arc_id IS NULL) THEN
				NEW.arc_id := (SELECT nextval('arc_id_seq'));
			END IF;
			
--			Arc catalog ID
			IF (NEW.arccat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_arc) = 0) THEN
					RAISE EXCEPTION 'There are no arcs catalog defined in the model, define at least one.';
				END IF;			
				NEW.arccat_id := (SELECT id FROM cat_arc LIMIT 1);
			END IF;

--			Sector ID
			IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RAISE EXCEPTION 'There are no sectors defined in the model, define at least one.';
				END IF;
				NEW.sector_id := (SELECT sector_id FROM sector LIMIT 1);
			END IF;

--			State
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state LIMIT 1);
			END IF;
			
--			DMA ID
			IF (NEW.dma_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM dma) = 0) THEN
					RAISE EXCEPTION 'There are no dmas defined in the model, define at least one.';
				END IF;
				NEW.dma_id := (SELECT dma_id FROM dma LIMIT 1);
			END IF;		
			
			
--			Soil ID
			IF (NEW.soilcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_soil) = 0) THEN
					RAISE EXCEPTION 'There are no soils defined in the model, define at least one.';
				END IF;
				NEW.soilcat_id := (SELECT id FROM cat_soil LIMIT 1);
			END IF;		
			
--			Category type
			IF (NEW.category_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_category) = 0) THEN
					RAISE EXCEPTION 'There are no categorys defined in the model, define at least one.';
				END IF;
				NEW.category_type := (SELECT id FROM man_type_category LIMIT 1);
			END IF;		

--			Fluid type
			IF (NEW.fluid_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_fluid) = 0) THEN
					RAISE EXCEPTION 'There are no fluids defined in the model, define at least one.';
				END IF;
				NEW.fluid_type := (SELECT id FROM man_type_fluid LIMIT 1);
			END IF;		

--			Location type
			IF (NEW.location_type IS NULL) THEN
				IF ((SELECT COUNT(*) FROM man_type_location) = 0) THEN
					RAISE EXCEPTION 'There are no locations defined in the model, define at least one.';
				END IF;
				NEW.location_type := (SELECT id FROM man_type_location LIMIT 1);
			END IF;	

--			Workcat_id
			IF (NEW.workcat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_work) = 0) THEN
					RAISE EXCEPTION 'There are no works defined in the model, define at least one.';
				END IF;
				NEW.workcat_id := (SELECT id FROM cat_work LIMIT 1);
			END IF;				
			
--			Buildercat_id
			IF (NEW.buildercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_builder) = 0) THEN
					RAISE EXCEPTION 'There are no builders defined in the model, define at least one.';
				END IF;
				NEW.buildercat_id := (SELECT id FROM cat_builder LIMIT 1);
			END IF;	

--			Ownercat_id
			IF (NEW.ownercat_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM cat_owner) = 0) THEN
					RAISE EXCEPTION 'There are no owners defined in the model, define at least one.';
				END IF;
				NEW.ownercat_id := (SELECT id FROM cat_owner LIMIT 1);
			END IF;	
						
--			Verified
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified LIMIT 1);
			END IF;
			
-- FEATURE INSERT
		INSERT INTO arc 	 		VALUES (NEW.arc_id, null, null, NEW.arccat_id, 'PIPE'::text, NEW.sector_id, NEW."state", NEW.annotation, NEW."observ", NEW."comment", NEW.custom_length,
											NEW.dma_id, NEW.soilcat_id, NEW.category_type, NEW.fluid_type, NEW.location_type, NEW.workcat_id, NEW.buildercat_id, NEW.builtdate, NEW.ownercat_id, 
											null, null, null, null, null, 
											NEW.rotation, NEW.link, NEW.verified, NEW.the_geom);
-- MANAGEMENT INSERT
		INSERT INTO man_pipe	VALUES (NEW.arc_id, NEW.add_info);	

-- EPA INSERT
		INSERT INTO  inp_pipe VALUES(NEW.arc_id, null, null);
									 
		RETURN NEW;
    
	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE arc 			SET arc_id=NEW.arc_id, arccat_id=NEW.arccat_id, sector_id=NEW.sector_id, "state"=NEW."state", annotation= NEW.annotation, "observ"=NEW."observ", "comment"=NEW."comment", custom_length=NEW.custom_length, 
								dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, category_type=NEW.category_type, fluid_type=NEW.fluid_type, location_type=NEW.location_type, workcat_id=NEW.workcat_id, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, 
								rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, the_geom=NEW.the_geom WHERE node_id=OLD.node_id;
		UPDATE man_pipe SET arc_id=NEW.arc_id, add_info=NEW.add_info WHERE arc_id=OLD.arc_id;
		RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM arc 			WHERE arc_id=OLD.arc_id;
		DELETE FROM man_pipe 	WHERE arc_id=OLD.arc_id;
	    RETURN NULL;
    
	END IF;
    RETURN NEW;
END;
$$;
  
  

CREATE TRIGGER v_edit_man_pipe 		INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_man_pipe 		FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".v_edit_man_pipe();
   
   