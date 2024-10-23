import express, { Request, Response } from 'express';
import { MysqlError } from 'mysql';
import db_knex from '../db/index_knex.js';
import {
  dbErrorHandler,
  requestErrorHandler,
  successHandler,
} from '../responseHandler/index.js';

const category = express.Router();

function handleErrorBasedOnErrno(
  req: Request,
  res: Response,
  error: MysqlError,
  defaultMessage: string,
) {
  switch (error.errno) {
    case 1062:
      requestErrorHandler(
        req,
        res,
        `Conflict: Category with the name ${req.body.name} already exists!`,
      );
      break;
    case 1054:
      requestErrorHandler(
        req,
        res,
        "error in spelling [either in 'name' and/or in 'description'].",
      );
      break;
    default:
      dbErrorHandler(req, res, error, defaultMessage);
      break;
  }
}

//get all categories

category.get('/', (req: Request, res: Response) => {
  db_knex('Category')
    .select()
    .then((data) => {
      successHandler(
        req,
        res,
        data,
        'Successfully read the categories from DB',
      );
    })
    .catch((err) => {
      dbErrorHandler(
        req,
        res,
        err,
        'Error trying to read all categories from DB',
      );
    });
});

// get category by id
category.get('/:id', (req: Request, res: Response) => {
  db_knex('Category')
    .select()
    .where('id', req.params.id)
    .then((data) => {
      if (data.length === 1) {
        successHandler(req, res, data, 'Successfully read the building rom DB');
      } else {
        requestErrorHandler(
          req,
          res,
          `Failed to fetch category from DB with id: ${req.params.id}`,
        );
      }
    })
    .catch((err) => {
      dbErrorHandler(req, res, err, 'Nothing came through- Category');
    });
});

// adding single category
category.post('/', (req: Request, res: Response) => {
  db_knex('Category')
    .insert(req.body)
    .into('Category')
    .then((idArray) => {
      successHandler(req, res, idArray, 'Adding a category was successfull');
    })
    .catch((error) => {
      handleErrorBasedOnErrno(req, res, error, 'error adding building');
    });
});

// adding single or multiple category

category.post('/multi', (req: Request, res: Response) => {
  db_knex('Category')
    .insert(req.body)
    .into('Category')
    .then((idArray) => {
      successHandler(
        req,
        res,
        idArray,
        'Adding a category, or multiple categories was seccesfull',
      );
    })
    .catch((error) => {
      handleErrorBasedOnErrno(req, res, error, 'error adding category');
    });
});

//updating category information
category.put('/', (req: Request, res: Response) => {
  if (!req.body.name) {
    requestErrorHandler(req, res, 'Category name is missing.');
  } else {
    db_knex('Category')
      .where('id', req.body.id)
      .update(req.body)
      .then((rowsAffected) => {
        if (rowsAffected === 1) {
          successHandler(
            req,
            res,
            rowsAffected,
            `Update category successfull! Count of modified rows:${rowsAffected}`,
          );
        } else {
          requestErrorHandler(
            req,
            res,
            `Update category not successful, ${rowsAffected} row modified`,
          );
        }
      })
      .catch((error) => {
        handleErrorBasedOnErrno(req, res, error, 'error updating category');
      });
  }
});

//delete category by id => DELETE /api/category/1
category.delete('/:id', (req: Request, res: Response) => {
  db_knex('Category')
    .select()
    .where('id', req.params.id)
    .del()
    .then((rowsAffected) => {
      if (rowsAffected === 1) {
        successHandler(
          req,
          res,
          rowsAffected,
          `Delete succesfull! Count of deleted rows: ${rowsAffected}`,
        );
      } else {
        requestErrorHandler(req, res, `Invalid building id: ${req.params.id}`);
      }
    })
    .catch((error) => {
      dbErrorHandler(req, res, error, 'Error deleting building');
    });
});
export default category;
