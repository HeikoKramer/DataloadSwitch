/**
 * Reduces one or more LWC errors into a string[] of error messages.
 * @param {FetchResponse|FetchResponse[]} errors
 * @return {String[]} Error messages
 */
const reduceErrors = errors => {
    if (!Array.isArray(errors)) {
        errors = [errors];
    }

    return (
        errors
            // Remove null/undefined items
            .filter(error => !!error)
            // Extract an error message
            .map(error => {
                // UI API read errors
                if (Array.isArray(error.body)) {
                    return error.body.map(e => e.message);
                }
                // UI API DML, Apex and network errors
                else if (error.body && typeof error.body.message === 'string') {
                    return error.body.message;
                }
                // JS errors
                else if (typeof error.message === 'string') {
                    return error.message;
                }
                // Unknown error shape so try HTTP status text
                return error.statusText;
            })
            // Flatten
            .reduce((prev, curr) => prev.concat(curr), [])
            // Remove empty strings
            .filter(message => !!message)
    );
};

/**
 * Service component with utility functions
 */
const SORTING_DIRECTION = { ASC: 'ASC', DESC: 'DESC' };

/**
 * Sorts a given 'data' array of objects by 'sortByField' field and 'direction' direction
 */
const sort = (data, sortByField, direction) => {
    // serialize the data before calling sort function
    let dataCopy = JSON.parse(JSON.stringify(data));

    // Return the value stored in the field
    let keyValue = (a) => {
        return a[sortByField];
    };

    // checks whether the direction is reverse
    let isReverse = direction.toUpperCase() === SORTING_DIRECTION.ASC ? 1 : -1;

    // sorting data
    dataCopy.sort((x, y) => {
        x = keyValue(x) ? keyValue(x) : ''; // handling null values
        y = keyValue(y) ? keyValue(y) : '';

        x = typeof x === 'string' ? x.toLowerCase() : x;
        y = typeof y === 'string' ? y.toLowerCase() : y;

        // sorting values based on direction
        return isReverse * ((x > y) - (y > x));
    });

    return dataCopy;
};

export { 
    SORTING_DIRECTION,
    sort,
    reduceErrors,
};