﻿/*
This file is part of Giswater
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/




-----------------------------
-- ARC-NODE TOPOLOGY
-----------------------------


CREATE OR REPLACE FUNCTION ws.node_update() RETURNS trigger LANGUAGE plpgsql AS $$

DECLARE 
	querystring Varchar; 
	arcrec Record; 
	nodeRecord1 Record; 
	nodeRecord2 Record; 

BEGIN 

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	
--	Select arcs with start-end on the updated node
	querystring := 'SELECT * FROM arc WHERE arc.node_1 = ' || quote_literal(NEW.node_id) || ' OR arc.node_2 = ' || quote_literal(NEW.node_id); 

	FOR arcrec IN EXECUTE querystring
	LOOP


--		Initial and final node of the arc
		SELECT * INTO nodeRecord1 FROM node WHERE node.node_id = arcrec.node_1;
		SELECT * INTO nodeRecord2 FROM node WHERE node.node_id = arcrec.node_2;


--		Control de lineas de longitud 0
		IF (nodeRecord1.node_id IS NOT NULL) AND (nodeRecord2.node_id IS NOT NULL) THEN


--			Update arc node coordinates, node_id and direction
			IF (nodeRecord1.node_id = NEW.node_id) THEN


--				Coordinates
				EXECUTE 'UPDATE arc SET the_geom = ST_SetPoint($1, 0, $2) WHERE arc_id = ' || quote_literal(arcrec."arc_id") USING arcrec.the_geom, NEW.the_geom; 

			ELSE

--				Coordinates
				EXECUTE 'UPDATE arc SET the_geom = ST_SetPoint($1, ST_NumPoints($1) - 1, $2) WHERE arc_id = ' || quote_literal(arcrec."arc_id") USING arcrec.the_geom, NEW.the_geom; 

			END IF;

		END IF;

	END LOOP; 

	RETURN NEW;
END; 
$$;


CREATE TRIGGER node_update AFTER UPDATE ON "ws"."node" FOR EACH ROW EXECUTE PROCEDURE "ws"."node_update"();





CREATE OR REPLACE FUNCTION ws.node_delete() RETURNS trigger LANGUAGE plpgsql AS $$
	
DECLARE 
	querystring Varchar; 
	arcrec Record; 
	nodosactualizados Integer; 

BEGIN 

	EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	
	nodosactualizados := 0; 
 	querystring := 'SELECT arc.arc_id AS arc_id FROM arc WHERE arc.node_1 = ' || quote_literal(OLD.node_id) || ' OR arc.node_2 = ' || quote_literal(OLD.node_id); 
	FOR arcrec IN EXECUTE querystring
	LOOP
		EXECUTE 'DELETE FROM arc WHERE arc_id = ' || quote_literal(arcrec."arc_id"); 
	END LOOP; 

	RETURN OLD; 
END; 
$$;



CREATE TRIGGER node_delete BEFORE DELETE ON "ws"."node" FOR EACH ROW EXECUTE PROCEDURE "ws"."node_delete"();