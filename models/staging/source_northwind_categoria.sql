{{
    config(
        materialized='table'
    )
}}

with -- pegando os dados brutos:
    raw_data as (
        select *
        from {{ source('nortwind', 'category') }}
    )

    , renomeacao as (
        select    -- transformacoes simples: 
            cast(ID as int) as pk_categoria
           , cast(CATEGORYNAME as varchar) as ds_nome_categoria
           , cast(DESCRIPTION as varchar) as ds_descricao_categoria    
        from raw_data
    )

select *
from renomeacao