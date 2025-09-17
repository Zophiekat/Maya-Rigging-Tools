# Occlusion/grid logic for Attribute Connector only

def get_socket_pos_and_occlusion(
    column, index, total, grid_positions, occlusion_grid, occluded_indices, corner=None
):
    """
    Returns the position for a socket, handling occlusion via per-corner grids.
    If the socket is occluded, it is placed on the grid at the specified corner.
    Otherwise, it is placed at its normal position in the column.
    Args:
        column: The column (input/output) this socket belongs to.
        index: The index of the socket in the column.
        total: Total number of sockets in the column.
        grid_positions: List of normal (non-occluded) socket positions for this column.
        occlusion_grid: Dict of per-corner grid positions, e.g. {'top_left': [...], 'bottom_right': [...]}.
        occluded_indices: List of indices in this column that are occluded.
        corner: Which corner's grid to use for occluded sockets (e.g. 'top_left').
    Returns:
        (pos, is_occluded, corner):
            pos: (x, y) position for the socket
            is_occluded: True if the socket is occluded
            corner: Which corner grid was used (if occluded)
    """
    if index in occluded_indices:
        # Occluded: use the per-corner grid
        if corner is None:
            # Default to 'top_left' if not specified
            corner = 'top_left'
        grid = occlusion_grid.get(corner, [])
        grid_index = occluded_indices.index(index)
        if grid_index < len(grid):
            pos = grid[grid_index]
            return pos, True, corner
        else:
            # Fallback: use the last grid position
            return grid[-1] if grid else (0, 0), True, corner
    else:
        # Not occluded: use the normal column position
        pos = grid_positions[index]
        return pos, False, None
