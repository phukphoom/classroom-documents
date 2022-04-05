import { useCallback, useState } from 'react';

const voteLimit = { min: 0, max: 10 };

const MemberCard = ({ name, id, info, imgSrc }) => {
    const [voteCount, setVoteCount] = useState(0);

    const handleIncreaseVote = useCallback(() => {
        if (voteCount < voteLimit.max) {
            setVoteCount(voteCount + 1);
        } else {
            window.alert("Can't vote over the limit");
        }
    }, [voteCount, setVoteCount]);

    const handleDecreaseVote = useCallback(() => {
        if (voteCount > voteLimit.min) {
            setVoteCount(voteCount - 1);
        } else {
            window.alert("Can't vote below the limit");
        }
    }, [voteCount, setVoteCount]);

    return (
        <div className="flex flex-col border rounded-md" style={{ width: '50%', padding: '2rem', backgroundColor: 'antiquewhite' }}>
            <div className="flex flex-row justify-between space-x">
                <div className="flex flex-col">
                    <h2>{name}</h2>
                    <h4>{id}</h4>
                    <p>{info}</p>
                </div>
                <img className="rounded-full" style={{ width: '10rem', height: '10rem', objectFit: 'cover' }} src={imgSrc} alt={`${name}-preview`} />
            </div>
            <div className="flex flex-row justify-center space-x" style={{ marginTop: '1.5rem' }}>
                <button type="button" onClick={handleIncreaseVote}>
                    Click to Vote
                </button>
                <div
                    className="border rounded-sm font-bold text-center uppercase"
                    style={{
                        width: '2.5rem',
                        padding: '0.5rem',
                        backgroundColor: `${voteCount === voteLimit.min ? 'rgb(185 28 28)' : voteCount === voteLimit.max ? 'rgb(21 128 61)' : 'rgb(253 224 71)'}`,
                        color: `${voteCount === voteLimit.min ? 'rgb(252 165 165)' : voteCount === voteLimit.max ? 'rgb(134 239 172)' : 'rgb(161 98 7)'}`,
                    }}
                >
                    {voteCount === voteLimit.min ? 'min' : voteCount === voteLimit.max ? 'max' : voteCount}
                </div>
                <button type="button" onClick={handleDecreaseVote}>
                    Click to Unvote
                </button>
            </div>
        </div>
    );
};

export default MemberCard;
