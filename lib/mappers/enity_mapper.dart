/// Contract for a generic DTO to entity mapper.
/// @param <D> - DTO type parameter.
/// @param <E> - Entity type parameter.
/// @author {@link "mailto:sergio@eturia.es"}

abstract class EntityMapper<D, E> {

    E toEntity(D dto);

    D toDTO(E entity);

    List<D> toDTOList(List<E> entityList);

}
