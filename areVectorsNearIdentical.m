function areNearIdentical = areVectorsNearIdentical(vec1, vec2, tolerance)
    % Check if vec1 and vec2 are near identical w/in the given tolerance.
    
    % Check if the vectors have the same length
    if length(vec1) ~= length(vec2)
        error('Vectors must have the same length.');
    end
        
    % Check element-wise near equality within the tolerance
    areNearIdentical = all(abs(vec1 - vec2) < tolerance);
     
end
