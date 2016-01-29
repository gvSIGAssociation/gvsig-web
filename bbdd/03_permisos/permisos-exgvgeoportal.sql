-- *****************************************************************************
--  gvGeoportal is sponsored by the General Directorate for Information
--  Technologies (DGTI) of the Regional Ministry of Finance and Public
--  Administration of the Generalitat Valenciana (Valencian Community,
--  Spain), managed by gvSIG Association and led by DISID Corporation.
--
--  Copyright (C) 2016 DGTI - Generalitat Valenciana
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as
--  published by the Free Software Foundation, either version 3 of the
--  License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.
--
--  You should have received a copy of the GNU Affero General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- *****************************************************************************
-- Grants user 'exgvgeoportal'
GRANT USAGE ON SCHEMA owgvgeoportal TO exgvgeoportal;
ALTER DEFAULT PRIVILEGES IN SCHEMA owgvgeoportal GRANT SELECT ON TABLES TO exgvgeoportal;
GRANT CONNECT ON DATABASE pg01desa TO exgvgeoportal;
GRANT USAGE ON SCHEMA owgvgeoportal TO exgvgeoportal;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA owgvgeoportal TO exgvgeoportal;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA owgvgeoportal TO exgvgeoportal;
